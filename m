From: davem at davemloft.net (David Miller)
Date: Mon, 01 Jul 2019 11:00:11 -0700 (PDT)
Subject: [Linux-kernel-mentees] [PATCH] net:gue.h:Fix shifting signed
 32-bit value by 31 bits problem
In-Reply-To: <20190701141610.3681-1-bnvandana@gmail.com>
References: <20190701141610.3681-1-bnvandana@gmail.com>
Message-ID: <20190701.110011.200125223653333509.davem@davemloft.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: Vandana BN <bnvandana at gmail.com>
Date: Mon,  1 Jul 2019 19:46:10 +0530

> Fix GUE_PFLAG_REMCSUM to use "U" cast to avoid shifting signed
> 32-bit value by 31 bits problem.
> 
> Signed-off-by: Vandana BN <bnvandana at gmail.com>

Applied.
