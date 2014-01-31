
#ifndef _reader_baton_h_
#define _reader_baton_h_

#include "connection.h"
#include "executeBaton.h"

class ReaderBaton : public ExecuteBaton {
public:
  ReaderBaton(Connection* connection, const char* sql, v8::Local<v8::Array>* values) : ExecuteBaton(connection, sql, values, NULL) {
    stmt = NULL;
    rs = NULL;
  }
  ~ReaderBaton() {
	if(stmt && rs) {
	  stmt->closeResultSet(rs);
      rs = NULL;
    }
    if(stmt) {
      if(connection->getConnection()) {
         connection->getConnection()->terminateStatement(stmt);
      }
      stmt = NULL;
    }
  }

  v8::Persistent<v8::Function> nextRowsCallback;  
  oracle::occi::Statement* stmt;
  oracle::occi::ResultSet* rs;
  int count;
};

#endif