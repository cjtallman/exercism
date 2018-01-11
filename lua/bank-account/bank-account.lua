
return {
    new = function()
        return setmetatable(
        {
            bal = 0,
            status = "open",
        },
        {
            __index = {
                balance = function(self)
                    return self.bal
                end,
                deposit = function(self, amt)
                    assert(amt > 0, "Deposit should be positive.")
                    assert(self.status == "open", "Cannot deposit to closed account.")
                    self.bal = self.bal + amt
                end,
                withdraw = function(self, amt)
                    assert(amt > 0, "Withdraw should be positive.")
                    assert(amt <= self.bal, "Withdraw should be less than balance.")
                    assert(self.status == "open", "Cannot withdraw from closed account.")
                    self.bal = self.bal - amt
                end,
                close = function(self)
                    assert(self.status == "open")
                    self.status = "closed"
                end,
            }
        })
    end,
}
