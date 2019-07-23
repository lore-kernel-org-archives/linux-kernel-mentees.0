From: davem at davemloft.net (David Miller)
Date: Mon, 22 Jul 2019 18:17:31 -0700 (PDT)
Subject: [Linux-kernel-mentees] [PATCH] drivers: net: xgene: Remove
	acpi_has_method() calls
In-Reply-To: <20190722030401.69563-1-skunberg.kelsey@gmail.com>
References: <20190722030401.69563-1-skunberg.kelsey@gmail.com>
Message-ID: <20190722.181731.1661840445301919861.davem@davemloft.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: Kelsey Skunberg <skunberg.kelsey at gmail.com>
Date: Sun, 21 Jul 2019 21:04:01 -0600

> +			 		      "_RST", NULL, NULL);
               ^^^^

SPACE before TAB in indentation.

> +				 	      "_RST", NULL, NULL);
                            ^^^^^^

Likewise.

GIT even warns about this when I try to apply this patch.

Please fix this.

Thank you.
