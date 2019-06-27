From: paulmck at linux.ibm.com (Paul E. McKenney)
Date: Thu, 27 Jun 2019 15:10:45 -0700
Subject: [Linux-kernel-mentees] [PATCH] doc: RCU callback locks need
 only _bh, not necessarily _irq
In-Reply-To: <bc2ce605-56ab-33aa-c94d-d7774e6ce8cd@linuxfoundation.org>
References: <20190627210147.19510-1-c0d1n61at3@gmail.com>
	<bc2ce605-56ab-33aa-c94d-d7774e6ce8cd@linuxfoundation.org>
Message-ID: <20190627221045.GH26519@linux.ibm.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Thu, Jun 27, 2019 at 04:01:35PM -0600, Shuah Khan wrote:
> On 6/27/19 3:01 PM, Jiunn Chang wrote:
> >The UP.rst file calls for locks acquired within RCU callback functions
> >to use _irq variants (spin_lock_irqsave() or similar), which does work,
> >but can be overkill.  This commit therefore instead calls for _bh variants
> >(spin_lock_bh() or similar), while noting that _irq does work.
> >
> >Signed-off-by: Paul E. McKenney <paulmck at linux.ibm.com>
> 
> Should this by Suggested-by?

I wrote it and Jiunn converted my change to .rst, so I believe that
this is correct as is.

							Thanx, Paul

> >Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> >---
> >  Documentation/RCU/UP.rst | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >
> >diff --git a/Documentation/RCU/UP.rst b/Documentation/RCU/UP.rst
> >index 67715a47ae89..e26dda27430c 100644
> >--- a/Documentation/RCU/UP.rst
> >+++ b/Documentation/RCU/UP.rst
> >@@ -113,12 +113,13 @@ Answer to Quick Quiz #1:
> >  Answer to Quick Quiz #2:
> >  	What locking restriction must RCU callbacks respect?
> >-	Any lock that is acquired within an RCU callback must be
> >-	acquired elsewhere using an _irq variant of the spinlock
> >-	primitive.  For example, if "mylock" is acquired by an
> >-	RCU callback, then a process-context acquisition of this
> >-	lock must use something like spin_lock_irqsave() to
> >-	acquire the lock.
> >+	Any lock that is acquired within an RCU callback must be acquired
> >+	elsewhere using an _bh variant of the spinlock primitive.
> >+	For example, if "mylock" is acquired by an RCU callback, then
> >+	a process-context acquisition of this lock must use something
> >+	like spin_lock_bh() to acquire the lock.  Please note that
> >+	it is also OK to use _irq variants of spinlocks, for example,
> >+	spin_lock_irqsave().
> >  	If the process-context code were to simply use spin_lock(),
> >  	then, since RCU callbacks can be invoked from softirq context,
> >
> 
> thanks,
> -- Shuah
> 
