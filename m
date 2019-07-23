From: davem at davemloft.net (David Miller)
Date: Tue, 23 Jul 2019 14:06:46 -0700 (PDT)
Subject: [Linux-kernel-mentees] [PATCH v2] drivers: net: xgene: Remove
	acpi_has_method() calls
In-Reply-To: <20190723185811.8548-1-skunberg.kelsey@gmail.com>
References: <20190722030401.69563-1-skunberg.kelsey@gmail.com>
	<20190723185811.8548-1-skunberg.kelsey@gmail.com>
Message-ID: <20190723.140646.505566792140054611.davem@davemloft.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: Kelsey Skunberg <skunberg.kelsey at gmail.com>
Date: Tue, 23 Jul 2019 12:58:11 -0600

> acpi_evaluate_object will already return an error if the needed method
> does not exist. Remove unnecessary acpi_has_method() calls and check the
> returned acpi_status for failure instead.
> 
> Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
> ---
> Changes in v2:
> 	- Fixed white space warnings and errors

Applied to net-next.
