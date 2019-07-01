From: davem at davemloft.net (David Miller)
Date: Mon, 01 Jul 2019 10:49:03 -0700 (PDT)
Subject: [Linux-kernel-mentees] [PATCH] net: dst.h: Fix shifting signed
 32-bit value by 31 bits problem
In-Reply-To: <20190701115539.6738-1-bnvandana@gmail.com>
References: <20190701115539.6738-1-bnvandana@gmail.com>
Message-ID: <20190701.104903.1353371516845397024.davem@davemloft.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: Vandana BN <bnvandana at gmail.com>
Date: Mon,  1 Jul 2019 17:25:39 +0530

> Fix DST_FEATURE_ECN_CA to use "U" cast to avoid shifting signed
> 32-bit value by 31 bits problem.
> 
> Signed-off-by: Vandana BN <bnvandana at gmail.com>

Applied.
