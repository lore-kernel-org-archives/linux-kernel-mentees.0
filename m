From: davem at davemloft.net (David Miller)
Date: Sat, 29 Jun 2019 11:06:40 -0700 (PDT)
Subject: [Linux-kernel-mentees] [PATCH v2] packet: Fix undefined
 behavior in bit shift
In-Reply-To: <20190627032532.18374-2-c0d1n61at3@gmail.com>
References: <20190627010137.5612-1-c0d1n61at3@gmail.com>
	<20190627032532.18374-2-c0d1n61at3@gmail.com>
Message-ID: <20190629.110640.41970452437281023.davem@davemloft.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: Jiunn Chang <c0d1n61at3 at gmail.com>
Date: Wed, 26 Jun 2019 22:25:30 -0500

> Shifting signed 32-bit value by 31 bits is undefined.  Changing most
> significant bit to unsigned.
> 
> Changes included in v2:
>   - use subsystem specific subject lines
>   - CC required mailing lists
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>

Applied.
