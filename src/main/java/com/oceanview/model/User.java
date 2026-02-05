
package com.oceanview.model;

import java.sql.Date;

public class User {

    private int userId;
    private String fullName;
    private String address;
    private Date dob;
    private Date registerDate;
    private String username;
    private String password;
    private String role;

    public int getUserId() { 
        return userId; 
    }
    public void setUserId(int userId) { 
        this.userId = userId; 
    }

    public String getFullName() { 
        return fullName; 
    }
    public void setFullName(String fullName) { 
        this.fullName = fullName; 
    }

    public String getAddress() { 
        return address; 
    }
    public void setAddress(String address) { 
        this.address = address; 
    }

    public Date getDob() { 
        return dob; 
    }
    public void setDob(Date dob) { 
        this.dob = dob; 
    }

    public Date getRegisterDate() { 
        return registerDate; 
    }
    public void setRegisterDate(Date registerDate) { 
        this.registerDate = registerDate; 
    }

    public String getUsername() { 
        return username; 
    }
    public void setUsername(String username) { 
        this.username = username; 
    }

    public String getPassword() { 
        return password; 
    }
    public void setPassword(String password) { 
        this.password = password; 
    }

    public String getRole() { 
        return role; 
    }
    public void setRole(String role) { 
        this.role = role; 
    }
}
