From: paulmck@linux.ibm.com (Paul E. McKenney)
Date: Thu, 27 Jun 2019 15:42:23 -0700
Subject: [Linux-kernel-mentees] [PATCH] doc: RCU callback locks need
 only _bh, not necessarily _irq
In-Reply-To: <20190627182938.306ab9d9@gandalf.local.home>
References: <20190627210147.19510-1-c0d1n61at3@gmail.com>
	<bc2ce605-56ab-33aa-c94d-d7774e6ce8cd@linuxfoundation.org>
	<20190627221045.GH26519@linux.ibm.com>
	<20190627182938.306ab9d9@gandalf.local.home>
Message-ID: <20190627224223.GJ26519@linux.ibm.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190627224223.rr92-OHDqDYR54Lw-9yA7qiLrRER0-qliLwRJI72wZc@z>

On Thu, Jun 27, 2019 at 06:29:38PM -0400, Steven Rostedt wrote:
> On Thu, 27 Jun 2019 15:10:45 -0700
> "Paul E. McKenney" <paulmck at linux.ibm.com> wrote:
> 
> > On Thu, Jun 27, 2019 at 04:01:35PM -0600, Shuah Khan wrote:
> > > On 6/27/19 3:01 PM, Jiunn Chang wrote:  
> > > >The UP.rst file calls for locks acquired within RCU callback functions
> > > >to use _irq variants (spin_lock_irqsave() or similar), which does work,
> > > >but can be overkill.  This commit therefore instead calls for _bh variants
> > > >(spin_lock_bh() or similar), while noting that _irq does work.
> > > >
> > > >Signed-off-by: Paul E. McKenney <paulmck at linux.ibm.com>  
> > > 
> > > Should this by Suggested-by?  
> > 
> > I wrote it and Jiunn converted my change to .rst, so I believe that
> > this is correct as is.
> 
> Note, you did send Jiunn an explicit Signed-off-by when you wrote it,
> correct? As Signed-off-by is equivalent to a signature.

Indeed I did, but I now see that it was via private email.  Here it is
again for public consumption, and Jiunn's patch is based on this one,
just translated to .rst.  I once again verified that the Jiunn's version
is word-for-word identical to mine, so Jiunn's patch should be good.  ;-)

							Thanx, Paul

------------------------------------------------------------------------

commit a293734a310b463a0dba68409943a4e6065cd39d
Author: Paul E. McKenney <paulmck at linux.ibm.com>
Date:   Wed Jun 26 10:16:19 2019 -0700

    doc: RCU callback locks need only _bh, not necessarily _irq
    
    The UP.txt file calls for locks acquired within RCU callback functions
    to use _irq variants (spin_lock_irqsave() or similar), which does work,
    but can be overkill.  This commit therefore instead calls for _bh variants
    (spin_lock_bh() or similar), while noting that _irq does work.
    
    Signed-off-by: Paul E. McKenney <paulmck at linux.ibm.com>

diff --git a/Documentation/RCU/UP.txt b/Documentation/RCU/UP.txt
index 53bde717017b..0edd8c5af0b5 100644
--- a/Documentation/RCU/UP.txt
+++ b/Documentation/RCU/UP.txt
@@ -104,12 +104,13 @@ Answer to Quick Quiz #1:
 Answer to Quick Quiz #2:
 	What locking restriction must RCU callbacks respect?
 
-	Any lock that is acquired within an RCU callback must be
-	acquired elsewhere using an _irq variant of the spinlock
-	primitive.  For example, if "mylock" is acquired by an
-	RCU callback, then a process-context acquisition of this
-	lock must use something like spin_lock_irqsave() to
-	acquire the lock.
+	Any lock that is acquired within an RCU callback must be acquired
+	elsewhere using an _bh variant of the spinlock primitive.
+	For example, if "mylock" is acquired by an RCU callback, then
+	a process-context acquisition of this lock must use something
+	like spin_lock_bh() to acquire the lock.  Please note that
+	it is also OK to use _irq variants of spinlocks, for example,
+	spin_lock_irqsave().
 
 	If the process-context code were to simply use spin_lock(),
 	then, since RCU callbacks can be invoked from softirq context,
