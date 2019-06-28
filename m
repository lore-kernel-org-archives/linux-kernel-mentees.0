From: corbet@lwn.net (Jonathan Corbet)
Date: Fri, 28 Jun 2019 09:11:01 -0600
Subject: [Linux-kernel-mentees] [PATCH] doc: RCU callback locks need
 only _bh, not necessarily _irq
In-Reply-To: <20190627210147.19510-1-c0d1n61at3@gmail.com>
References: <20190627210147.19510-1-c0d1n61at3@gmail.com>
Message-ID: <20190628091101.5f4d35e3@lwn.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190628151101.v27xfxNHe4lCZ5P8vGRy73UUdS6ZNMLXLWubrOcryE4@z>

On Thu, 27 Jun 2019 16:01:47 -0500
Jiunn Chang <c0d1n61at3 at gmail.com> wrote:

> The UP.rst file calls for locks acquired within RCU callback functions
> to use _irq variants (spin_lock_irqsave() or similar), which does work,
> but can be overkill.  This commit therefore instead calls for _bh variants
> (spin_lock_bh() or similar), while noting that _irq does work.
> 
> Signed-off-by: Paul E. McKenney <paulmck at linux.ibm.com>
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---
>  Documentation/RCU/UP.rst | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

Applied, thanks.

jon
