From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Tue, 23 Jul 2019 23:56:44 -0600
Subject: [Linux-kernel-mentees] [PATCH v2] drivers: net: xgene: Remove
	acpi_has_method() calls
In-Reply-To: <20190723.140739.379654507424022463.davem@davemloft.net>
References: <20190722030401.69563-1-skunberg.kelsey@gmail.com>
	<20190723185811.8548-1-skunberg.kelsey@gmail.com>
	<20190723.140646.505566792140054611.davem@davemloft.net>
	<20190723.140739.379654507424022463.davem@davemloft.net>
Message-ID: <20190724055644.GA103525@JATN>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Tue, Jul 23, 2019 at 02:07:39PM -0700, David Miller wrote:
> From: David Miller <davem at davemloft.net>
> Date: Tue, 23 Jul 2019 14:06:46 -0700 (PDT)
> 
> > From: Kelsey Skunberg <skunberg.kelsey at gmail.com>
> > Date: Tue, 23 Jul 2019 12:58:11 -0600
> > 
> >> acpi_evaluate_object will already return an error if the needed method
> >> does not exist. Remove unnecessary acpi_has_method() calls and check the
> >> returned acpi_status for failure instead.
> >> 
> >> Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
> >> ---
> >> Changes in v2:
> >> 	- Fixed white space warnings and errors
> > 
> > Applied to net-next.
> 
> Wow did you even build test this?   Reverted...
>
This patch has definitely been a mess, so thank you for your time and
sticking with me here. I thought my build tests included these files,
though discovered they did not. Since submitting v2, I was able to reproduce the
same errors you listed and corrected the problem in v3.

I also realized my .git/post-commit file needed to be fixed, so the white
space problem in v1 should also not be a problem in the future.

Please let me know if you notice anything else I can improve on. I will
learn from my mistakes and really appreciate advice. Thank you again, David.

Best Regards,
Kelsey
