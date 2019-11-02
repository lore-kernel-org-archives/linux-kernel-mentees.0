From: tranmanphong@gmail.com (Phong Tran)
Date: Sat, 2 Nov 2019 19:00:49 +0700
Subject: [Linux-kernel-mentees] [PATCH] Doc: convert whatisRCU.txt to rst
In-Reply-To: <CAF65HP0uA-6Gna=QqUnybRO1rqkOgem-Lvezs63n00x3J=qaKQ@mail.gmail.com>
References: <20191030233128.14997-1-tranmanphong@gmail.com>
	<CAF65HP0uA-6Gna=QqUnybRO1rqkOgem-Lvezs63n00x3J=qaKQ@mail.gmail.com>
Message-ID:
 <CAD3AR6E2yqG=uR-racZKui5DLgMHuw3zLWqYDC_80ZqOsRLqiA@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191102120049.zGNxcaQIXzCjEBSinD_7siuap9htcDXQ9Cx1jQEIilw@z>

On Sat, Nov 2, 2019 at 3:31 PM Madhuparna Bhowmik <
madhuparnabhowmik04 at gmail.com> wrote:

> I reviewed this patch, and I have the following suggestions:
>
> Thank for feedback. I did some change adding the cross-ref. patch sent
also apply in rcu-dev branch.

https://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/2019-November/001019.html

Regards,
Phong.

> On Thu, Oct 31, 2019 at 5:04 AM Phong Tran <tranmanphong at gmail.com> wrote:
>
>> Sync the format with current state of kernel documentation.
>> This change base on rcu-dev branch
>> what changed:
>> - Format bullet lists
>> - Add literal blocks
>>
>> Signed-off-by: Phong Tran <tranmanphong at gmail.com>
>> ---
>>  Documentation/RCU/index.rst                   |   1 +
>>  .../RCU/{whatisRCU.txt => whatisRCU.rst}      | 150 +++++++++++-------
>>  2 files changed, 90 insertions(+), 61 deletions(-)
>>  rename Documentation/RCU/{whatisRCU.txt => whatisRCU.rst} (91%)
>>
>> diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
>> index 627128c230dc..b9b11481c727 100644
>> --- a/Documentation/RCU/index.rst
>> +++ b/Documentation/RCU/index.rst
>> @@ -8,6 +8,7 @@ RCU concepts
>>     :maxdepth: 3
>>
>>     arrayRCU
>> +   whatisRCU
>>     rcu
>>     listRCU
>>     NMI-RCU
>> diff --git a/Documentation/RCU/whatisRCU.txt
>> b/Documentation/RCU/whatisRCU.rst
>> similarity index 91%
>> rename from Documentation/RCU/whatisRCU.txt
>> rename to Documentation/RCU/whatisRCU.rst
>> index 58ba05c4d97f..70d0e4c21917 100644
>> --- a/Documentation/RCU/whatisRCU.txt
>> +++ b/Documentation/RCU/whatisRCU.rst
>> @@ -1,15 +1,18 @@
>> +.. _rcu_doc:
>> +
>>  What is RCU?  --  "Read, Copy, Update"
>> +======================================
>>
>>  Please note that the "What is RCU?" LWN series is an excellent place
>>  to start learning about RCU:
>>
>> -1.     What is RCU, Fundamentally?  http://lwn.net/Articles/262464/
>> -2.     What is RCU? Part 2: Usage   http://lwn.net/Articles/263130/
>> -3.     RCU part 3: the RCU API      http://lwn.net/Articles/264090/
>> -4.     The RCU API, 2010 Edition    http://lwn.net/Articles/418853/
>> -       2010 Big API Table           http://lwn.net/Articles/419086/
>> -5.     The RCU API, 2014 Edition    http://lwn.net/Articles/609904/
>> -       2014 Big API Table           http://lwn.net/Articles/609973/
>> +| 1.   What is RCU, Fundamentally?  http://lwn.net/Articles/262464/
>> +| 2.   What is RCU? Part 2: Usage   http://lwn.net/Articles/263130/
>> +| 3.   RCU part 3: the RCU API      http://lwn.net/Articles/264090/
>> +| 4.   The RCU API, 2010 Edition    http://lwn.net/Articles/418853/
>> +|      2010 Big API Table           http://lwn.net/Articles/419086/
>> +| 5.   The RCU API, 2014 Edition    http://lwn.net/Articles/609904/
>> +|      2014 Big API Table           http://lwn.net/Articles/609973/
>>
>>
> Adding an external link here would be better.
> like this :  `text <link URL>`_
>
>  What is RCU?
>> @@ -51,6 +54,7 @@ never need this document anyway.  ;-)
>>
>>
>>
> There is a list of topics that are covered in this documentation.
> Like this:
>
> 1. RCU OVERVIEW
> 2. WHAT IS RCU?S CORE API?
> 3. WHAT ARE SOME EXAMPLE USES OF CORE RCU API?
> 4. WHAT IF MY UPDATING THREAD CANNOT BLOCK?
> ...
>
>  since this document is quite big adding cross-references to the above
> would be helpful.
>
>
>>  1.  RCU OVERVIEW
>> +----------------
>>
>>  The basic idea behind RCU is to split updates into "removal" and
>>  "reclamation" phases.  The removal phase removes references to data items
>> @@ -118,6 +122,7 @@ Read on to learn about how RCU's API makes this easy.
>>
>>
>>  2.  WHAT IS RCU'S CORE API?
>> +---------------------------
>>
>>  The core RCU API is quite small:
>>
>> @@ -166,7 +171,7 @@ synchronize_rcu()
>>         read-side critical sections on all CPUs have completed.
>>         Note that synchronize_rcu() will -not- necessarily wait for
>>         any subsequent RCU read-side critical sections to complete.
>> -       For example, consider the following sequence of events:
>> +       For example, consider the following sequence of events::
>>
>>                  CPU 0                  CPU 1                 CPU 2
>>              ----------------- ------------------------- ---------------
>> @@ -248,13 +253,13 @@ rcu_dereference()
>>
>>         Common coding practice uses rcu_dereference() to copy an
>>         RCU-protected pointer to a local variable, then dereferences
>> -       this local variable, for example as follows:
>> +       this local variable, for example as follows::
>>
>>                 p = rcu_dereference(head.next);
>>                 return p->data;
>>
>>         However, in this case, one could just as easily combine these
>> -       into one statement:
>> +       into one statement::
>>
>>                 return rcu_dereference(head.next)->data;
>>
>> @@ -267,7 +272,7 @@ rcu_dereference()
>>
>>         Note that the value returned by rcu_dereference() is valid
>>         only within the enclosing RCU read-side critical section [1].
>> -       For example, the following is -not- legal:
>> +       For example, the following is -not- legal::
>>
>>                 rcu_read_lock();
>>                 p = rcu_dereference(head.next);
>> @@ -315,6 +320,7 @@ rcu_dereference()
>>
>>  The following diagram shows how each API communicates among the
>>  reader, updater, and reclaimer.
>> +::
>>
>>
>>             rcu_assign_pointer()
>> @@ -377,10 +383,12 @@ for specialized uses, but are relatively uncommon.
>>
>>
>>  3.  WHAT ARE SOME EXAMPLE USES OF CORE RCU API?
>> +-----------------------------------------------
>>
>>  This section shows a simple use of the core RCU API to protect a
>>  global pointer to a dynamically allocated structure.  More-typical
>>  uses of RCU may be found in listRCU.txt, arrayRCU.txt, and NMI-RCU.txt.
>> +::
>>
>>         struct foo {
>>                 int a;
>> @@ -467,13 +475,14 @@ arrayRCU.txt, and NMI-RCU.txt.
>>
>>
>>  4.  WHAT IF MY UPDATING THREAD CANNOT BLOCK?
>> +--------------------------------------------
>>
>>  In the example above, foo_update_a() blocks until a grace period elapses.
>>  This is quite simple, but in some cases one cannot afford to wait so
>>  long -- there might be other high-priority work to be done.
>>
>>  In such cases, one uses call_rcu() rather than synchronize_rcu().
>> -The call_rcu() API is as follows:
>> +The call_rcu() API is as follows::
>>
>>         void call_rcu(struct rcu_head * head,
>>                       void (*func)(struct rcu_head *head));
>> @@ -481,7 +490,7 @@ The call_rcu() API is as follows:
>>  This function invokes func(head) after a grace period has elapsed.
>>  This invocation might happen from either softirq or process context,
>>  so the function is not permitted to block.  The foo struct needs to
>> -have an rcu_head structure added, perhaps as follows:
>> +have an rcu_head structure added, perhaps as follows::
>>
>>         struct foo {
>>                 int a;
>> @@ -490,7 +499,7 @@ have an rcu_head structure added, perhaps as follows:
>>                 struct rcu_head rcu;
>>         };
>>
>> -The foo_update_a() function might then be written as follows:
>> +The foo_update_a() function might then be written as follows::
>>
>>         /*
>>          * Create a new struct foo that is the same as the one currently
>> @@ -520,7 +529,7 @@ The foo_update_a() function might then be written as
>> follows:
>>                 call_rcu(&old_fp->rcu, foo_reclaim);
>>         }
>>
>> -The foo_reclaim() function might appear as follows:
>> +The foo_reclaim() function might appear as follows::
>>
>>         void foo_reclaim(struct rcu_head *rp)
>>         {
>> @@ -552,7 +561,7 @@ o   Use call_rcu() -after- removing a data element
>> from an
>>
>>  If the callback for call_rcu() is not doing anything more than calling
>>  kfree() on the structure, you can use kfree_rcu() instead of call_rcu()
>> -to avoid having to write your own callback:
>> +to avoid having to write your own callback::
>>
>>         kfree_rcu(old_fp, rcu);
>>
>> @@ -560,6 +569,7 @@ Again, see checklist.txt for additional rules
>> governing the use of RCU.
>>
>>
>>  5.  WHAT ARE SOME SIMPLE IMPLEMENTATIONS OF RCU?
>> +------------------------------------------------
>>
>>  One of the nice things about RCU is that it has extremely simple "toy"
>>  implementations that are a good first step towards understanding the
>> @@ -591,7 +601,7 @@ you allow nested rcu_read_lock() calls, you can
>> deadlock.
>>  However, it is probably the easiest implementation to relate to, so is
>>  a good starting point.
>>
>> -It is extremely simple:
>> +It is extremely simple::
>>
>>         static DEFINE_RWLOCK(rcu_gp_mutex);
>>
>> @@ -614,7 +624,7 @@ It is extremely simple:
>>
>>  [You can ignore rcu_assign_pointer() and rcu_dereference() without
>> missing
>>  much.  But here are simplified versions anyway.  And whatever you do,
>> -don't forget about them when submitting patches making use of RCU!]
>> +don't forget about them when submitting patches making use of RCU!]::
>>
>>         #define rcu_assign_pointer(p, v) \
>>         ({ \
>> @@ -659,6 +669,7 @@ This section presents a "toy" RCU implementation that
>> is based on
>>  on features such as hotplug CPU and the ability to run in CONFIG_PREEMPT
>>  kernels.  The definitions of rcu_dereference() and rcu_assign_pointer()
>>  are the same as those shown in the preceding section, so they are
>> omitted.
>> +::
>>
>>         void rcu_read_lock(void) { }
>>
>> @@ -707,10 +718,12 @@ Quick Quiz #3:  If it is illegal to block in an RCU
>> read-side
>>
>>
>>  6.  ANALOGY WITH READER-WRITER LOCKING
>> +--------------------------------------
>>
>>  Although RCU can be used in many different ways, a very common use of
>>  RCU is analogous to reader-writer locking.  The following unified
>>  diff shows how closely related RCU and reader-writer locking can be.
>> +::
>>
>>         @@ -5,5 +5,5 @@ struct el {
>>                 int data;
>> @@ -762,7 +775,7 @@ diff shows how closely related RCU and reader-writer
>> locking can be.
>>                 return 0;
>>          }
>>
>> -Or, for those who prefer a side-by-side listing:
>> +Or, for those who prefer a side-by-side listing::
>>
>>   1 struct el {                          1 struct el {
>>   2   struct list_head list;             2   struct list_head list;
>> @@ -774,40 +787,44 @@ Or, for those who prefer a side-by-side listing:
>>   8 rwlock_t listmutex;                  8 spinlock_t listmutex;
>>   9 struct el head;                      9 struct el head;
>>
>> - 1 int search(long key, int *result)    1 int search(long key, int
>> *result)
>> - 2 {                                    2 {
>> - 3   struct list_head *lp;              3   struct list_head *lp;
>> - 4   struct el *p;                      4   struct el *p;
>> - 5                                      5
>> - 6   read_lock(&listmutex);             6   rcu_read_lock();
>> - 7   list_for_each_entry(p, head, lp) { 7   list_for_each_entry_rcu(p,
>> head, lp) {
>> - 8     if (p->key == key) {             8     if (p->key == key) {
>> - 9       *result = p->data;             9       *result = p->data;
>> -10       read_unlock(&listmutex);      10       rcu_read_unlock();
>> -11       return 1;                     11       return 1;
>> -12     }                               12     }
>> -13   }                                 13   }
>> -14   read_unlock(&listmutex);          14   rcu_read_unlock();
>> -15   return 0;                         15   return 0;
>> -16 }                                   16 }
>> -
>> - 1 int delete(long key)                 1 int delete(long key)
>> - 2 {                                    2 {
>> - 3   struct el *p;                      3   struct el *p;
>> - 4                                      4
>> - 5   write_lock(&listmutex);            5   spin_lock(&listmutex);
>> - 6   list_for_each_entry(p, head, lp) { 6   list_for_each_entry(p, head,
>> lp) {
>> - 7     if (p->key == key) {             7     if (p->key == key) {
>> - 8       list_del(&p->list);            8       list_del_rcu(&p->list);
>> - 9       write_unlock(&listmutex);      9       spin_unlock(&listmutex);
>> -                                       10       synchronize_rcu();
>> -10       kfree(p);                     11       kfree(p);
>> -11       return 1;                     12       return 1;
>> -12     }                               13     }
>> -13   }                                 14   }
>> -14   write_unlock(&listmutex);         15   spin_unlock(&listmutex);
>> -15   return 0;                         16   return 0;
>> -16 }                                   17 }
>> +::
>> +
>> +  1 int search(long key, int *result)    1 int search(long key, int
>> *result)
>> +  2 {                                    2 {
>> +  3   struct list_head *lp;              3   struct list_head *lp;
>> +  4   struct el *p;                      4   struct el *p;
>> +  5                                      5
>> +  6   read_lock(&listmutex);             6   rcu_read_lock();
>> +  7   list_for_each_entry(p, head, lp) { 7   list_for_each_entry_rcu(p,
>> head, lp) {
>> +  8     if (p->key == key) {             8     if (p->key == key) {
>> +  9       *result = p->data;             9       *result = p->data;
>> + 10       read_unlock(&listmutex);      10       rcu_read_unlock();
>> + 11       return 1;                     11       return 1;
>> + 12     }                               12     }
>> + 13   }                                 13   }
>> + 14   read_unlock(&listmutex);          14   rcu_read_unlock();
>> + 15   return 0;                         15   return 0;
>> + 16 }                                   16 }
>> +
>> +::
>> +
>> +  1 int delete(long key)                 1 int delete(long key)
>> +  2 {                                    2 {
>> +  3   struct el *p;                      3   struct el *p;
>> +  4                                      4
>> +  5   write_lock(&listmutex);            5   spin_lock(&listmutex);
>> +  6   list_for_each_entry(p, head, lp) { 6   list_for_each_entry(p,
>> head, lp) {
>> +  7     if (p->key == key) {             7     if (p->key == key) {
>> +  8       list_del(&p->list);            8       list_del_rcu(&p->list);
>> +  9       write_unlock(&listmutex);      9       spin_unlock(&listmutex);
>> +                                        10       synchronize_rcu();
>> + 10       kfree(p);                     11       kfree(p);
>> + 11       return 1;                     12       return 1;
>> + 12     }                               13     }
>> + 13   }                                 14   }
>> + 14   write_unlock(&listmutex);         15   spin_unlock(&listmutex);
>> + 15   return 0;                         16   return 0;
>> + 16 }                                   17 }
>>
>>  Either way, the differences are quite small.  Read-side locking moves
>>  to rcu_read_lock() and rcu_read_unlock, update-side locking moves from
>> @@ -827,13 +844,14 @@ be used in place of synchronize_rcu().
>>
>>
>>  7.  FULL LIST OF RCU APIs
>> +-------------------------
>>
>>  The RCU APIs are documented in docbook-format header comments in the
>>  Linux-kernel source code, but it helps to have a full list of the
>>  APIs, since there does not appear to be a way to categorize them
>>  in docbook.  Here is the list, by category.
>>
>> -RCU list traversal:
>> +RCU list traversal::
>>
>>         list_entry_rcu
>>         list_first_entry_rcu
>> @@ -854,7 +872,7 @@ RCU list traversal:
>>         hlist_bl_first_rcu
>>         hlist_bl_for_each_entry_rcu
>>
>> -RCU pointer/list update:
>> +RCU pointer/list udate::
>>
>>         rcu_assign_pointer
>>         list_add_rcu
>> @@ -876,7 +894,9 @@ RCU pointer/list update:
>>         hlist_bl_del_rcu
>>         hlist_bl_set_first_rcu
>>
>> -RCU:   Critical sections       Grace period            Barrier
>> +RCU::
>> +
>> +       Critical sections       Grace period            Barrier
>>
>>         rcu_read_lock           synchronize_net         rcu_barrier
>>         rcu_read_unlock         synchronize_rcu
>> @@ -885,7 +905,9 @@ RCU:        Critical sections       Grace period
>>       Barrier
>>         rcu_dereference_check   kfree_rcu
>>         rcu_dereference_protected
>>
>> -bh:    Critical sections       Grace period            Barrier
>> +bh::
>> +
>> +       Critical sections       Grace period            Barrier
>>
>>         rcu_read_lock_bh        call_rcu                rcu_barrier
>>         rcu_read_unlock_bh      synchronize_rcu
>> @@ -896,7 +918,9 @@ bh: Critical sections       Grace period
>> Barrier
>>         rcu_dereference_bh_protected
>>         rcu_read_lock_bh_held
>>
>> -sched: Critical sections       Grace period            Barrier
>> +sched::
>> +
>> +       Critical sections       Grace period            Barrier
>>
>>         rcu_read_lock_sched     call_rcu                rcu_barrier
>>         rcu_read_unlock_sched   synchronize_rcu
>> @@ -910,7 +934,9 @@ sched:      Critical sections       Grace period
>>       Barrier
>>         rcu_read_lock_sched_held
>>
>>
>> -SRCU:  Critical sections       Grace period            Barrier
>> +SRCU::
>> +
>> +       Critical sections       Grace period            Barrier
>>
>>         srcu_read_lock          call_srcu               srcu_barrier
>>         srcu_read_unlock        synchronize_srcu
>> @@ -918,13 +944,14 @@ SRCU:     Critical sections       Grace period
>>       Barrier
>>         srcu_dereference_check
>>         srcu_read_lock_held
>>
>> -SRCU:  Initialization/cleanup
>> +SRCU: Initialization/cleanup::
>> +
>>         DEFINE_SRCU
>>         DEFINE_STATIC_SRCU
>>         init_srcu_struct
>>         cleanup_srcu_struct
>>
>> -All:  lockdep-checked RCU-protected pointer access
>> +All: lockdep-checked RCU-protected pointer access::
>>
>>         rcu_access_pointer
>>         rcu_dereference_raw
>> @@ -976,6 +1003,7 @@ the right tool for your job.
>>
>>
>>  8.  ANSWERS TO QUICK QUIZZES
>> +----------------------------
>>
>>  Quick Quiz #1: Why is this argument naive?  How could a deadlock
>>                 occur when using this algorithm in a real-world Linux
>>
>
> Here, the formatting is not proper. In the rst file, the question should
> be added in the next line after Quick Quiz #1. Currently, half of the
> question appears in bold and the rest half does not.
> Also, as followed in all the documents there should be a cross-reference
> to the answer to this question. As this document is quite big having
> references would be helpful.
> The same applies to all other quick quiz questions in this document and in
> the Answers section as well the questions do not appear properly, half in
> bold text and half not bold.
>
> Apart from this, the other added changes look good!
>
> Thank you
> Madhuparna
>
> --
>> 2.20.1
>>
>> _______________________________________________
>> Linux-kernel-mentees mailing list
>> Linux-kernel-mentees at lists.linuxfoundation.org
>> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
>>
> ?
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/attachments/20191102/27b15b9b/attachment-0001.html>
