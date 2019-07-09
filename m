From: davem at davemloft.net (David Miller)
Date: Tue, 09 Jul 2019 14:52:41 -0700 (PDT)
Subject: [Linux-kernel-mentees] [PATCH] ide: use BIT() macro for
	defining bit-flags
In-Reply-To: <20190707085729.GA22964@arch>
References: <20190707085729.GA22964@arch>
Message-ID: <20190709.145241.634478641391763394.davem@davemloft.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: Amol Surati <suratiamol at gmail.com>
Date: Sun, 7 Jul 2019 14:27:29 +0530

> The BIT() macro is available for defining the required bit-flags.
> 
> Since it operates on an unsigned value and expands to an unsigned result,
> using it, instead of an expression like (1 << x), also fixes the problem
> of shifting a signed 32-bit value by 31 bits (e.g. 1 << 31).
> 
> Signed-off-by: Amol Surati <suratiamol at gmail.com>

Applied, thank you.
