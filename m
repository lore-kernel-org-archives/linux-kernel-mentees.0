From: davem@davemloft.net (David Miller)
Date: Wed, 24 Jul 2019 11:30:08 -0700 (PDT)
Subject: [Linux-kernel-mentees] [PATCH v3] drivers: net: xgene: Remove
	acpi_has_method() calls
In-Reply-To: <20190724060659.105292-1-skunberg.kelsey@gmail.com>
References: <20190723185811.8548-1-skunberg.kelsey@gmail.com>
	<20190724060659.105292-1-skunberg.kelsey@gmail.com>
Message-ID: <20190724.113008.1837834250766825392.davem@davemloft.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190724183008.Slcp-MK8YEOvusiBA_Vv259XVl59bwkso-hIYv_YUco@z>

From: Kelsey Skunberg <skunberg.kelsey@gmail.com>
Date: Wed, 24 Jul 2019 00:06:59 -0600

> acpi_evaluate_object will already return an error if the needed method
> does not exist. Remove unnecessary acpi_has_method() calls and check the
> returned acpi_status for failure instead.
> 
> Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
> ---
> Changes in v2:
> 	- Fixed white space warnings and errors
> 
> Changes in v3:
> 	- Resolved build errors caused by missing bracket

Applied, will push out after build testing :)
