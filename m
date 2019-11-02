Return-Path: <SRS0=JPIQ=Y2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_LOW_CONTRAST,HTML_MESSAGE,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MIME_HTML_MOSTLY,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED6ACA9EC7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 Nov 2019 12:01:07 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0873420679
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 Nov 2019 12:01:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uFFyl0BR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0873420679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D4E10E47;
	Sat,  2 Nov 2019 12:01:06 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1F2A6E39
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat,  2 Nov 2019 12:01:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6F9A714D
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat,  2 Nov 2019 12:01:02 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a15so12170352wrf.9
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 02 Nov 2019 05:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O2KsGLiND+W2Yh38SHZotwgs3GY4+1KC+dZGrW9Cuaw=;
	b=uFFyl0BRdklhtV42n5lj8mSjkErSE5z6u9D9Lv1X2zqCjYuyGUg89MC/bmm577XYVp
	UcmEdvjxMoFNp4esbZ6eNVHtAVqKBDNSmavrxrWqE4Js26sUOwdHPNCEFjtyrJ5vRzsO
	4FmWlgevKfu0cRQRBoXlG3IWK/gA9pgsPg/bqfzygqEvaH9YfhA6xrnRRPz+AssivhFV
	Sfm/LUWn6A9zT1gZOiSs0GuJDlCSVgDFeEipkM6D2vGbvmsnlXKCXQhlsAzyVcy7q1z/
	mVd5YcYTY+RkP3CLvZEP3H/jYx+agSam6C76EyFeVsuVg5/kZ1Oi3+1iLVITCVpgA4gm
	tYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O2KsGLiND+W2Yh38SHZotwgs3GY4+1KC+dZGrW9Cuaw=;
	b=IrVS1bxK+G7J+PPeCAwQk4g/NfSAMfgXp37WRPKd0KLWVF998kT85w03Q1fDIV1nJg
	I3IhxP6st59McfOfhQ4j1e5s1xwuv50F8soTfoLZOaztA/ktBd2oTnOdedCznPOGOP4p
	8zOwcJbqnf9VKNyBu0Apkqao7hORyT5WFlNkdbydSexhPrBl1uKDEb9SeqJ2R6FxZuzm
	P47movR3LAQGWN1M/oHTHv6cb5wuNVArcrNIY9NNcHQtykNxs9h8anQXkMNi2nPm8/IK
	Bh/GiT6WkFPRR5kiZjsGfuEmDIZlKyuhsDQLmLLzAyWNY8p/8WHcDLu3a6R8Uh56pNHE
	MX2g==
X-Gm-Message-State: APjAAAV1S2z5rjeJ+BD5bOZSqYBe50fJOOlVpoHfGRIWIU5PeiMN1bZA
	wZ2mHbBGYZ+hbubEZ86nl/OdUMBXh+qCasb7/R0=
X-Google-Smtp-Source: APXvYqwVx6fss6ZrZNqsCwpcEB/fB9MKfVwBwfmJxIdTlVOW2lC9F3jVFpAwmjYrGGviOcpKlvPiOj1WJT1rqO4G/wI=
X-Received: by 2002:adf:e386:: with SMTP id e6mr1249796wrm.397.1572696060845; 
	Sat, 02 Nov 2019 05:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191030233128.14997-1-tranmanphong@gmail.com>
	<CAF65HP0uA-6Gna=QqUnybRO1rqkOgem-Lvezs63n00x3J=qaKQ@mail.gmail.com>
In-Reply-To: <CAF65HP0uA-6Gna=QqUnybRO1rqkOgem-Lvezs63n00x3J=qaKQ@mail.gmail.com>
From: Phong Tran <tranmanphong@gmail.com>
Date: Sat, 2 Nov 2019 19:00:49 +0700
Message-ID:
 <CAD3AR6E2yqG=uR-racZKui5DLgMHuw3zLWqYDC_80ZqOsRLqiA@mail.gmail.com>
To: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Cc: paulmck@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, jiangshanlai@gmail.com,
	josh@joshtriplett.org, rostedt@goodmis.org,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	mathieu.desnoyers@efficios.com, Joel Fernandes <joel@joelfernandes.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Doc: convert whatisRCU.txt to rst
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8788838115013394139=="
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Message-ID: <20191102120049.oC0at3vkppmRTSFEt8CwG-MgWLEBlxBM1uuDv-rdrNQ@z>

--===============8788838115013394139==
Content-Type: multipart/alternative; boundary="0000000000000be2e305965bd6bd"

--0000000000000be2e305965bd6bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 2, 2019 at 3:31 PM Madhuparna Bhowmik <
madhuparnabhowmik04@gmail.com> wrote:

> I reviewed this patch, and I have the following suggestions:
>
> Thank for feedback. I did some change adding the cross-ref. patch sent
also apply in rcu-dev branch.

https://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/2019-Novem=
ber/001019.html

Regards,
Phong.

> On Thu, Oct 31, 2019 at 5:04 AM Phong Tran <tranmanphong@gmail.com> wrote=
:
>
>> Sync the format with current state of kernel documentation.
>> This change base on rcu-dev branch
>> what changed:
>> - Format bullet lists
>> - Add literal blocks
>>
>> Signed-off-by: Phong Tran <tranmanphong@gmail.com>
>> ---
>>  Documentation/RCU/index.rst                   |   1 +
>>  .../RCU/{whatisRCU.txt =3D> whatisRCU.rst}      | 150 +++++++++++------=
-
>>  2 files changed, 90 insertions(+), 61 deletions(-)
>>  rename Documentation/RCU/{whatisRCU.txt =3D> whatisRCU.rst} (91%)
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
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
> 2. WHAT IS RCU=E2=80=99S CORE API?
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
>>  "reclamation" phases.  The removal phase removes references to data ite=
ms
>> @@ -118,6 +122,7 @@ Read on to learn about how RCU's API makes this easy=
.
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
>>                 p =3D rcu_dereference(head.next);
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
>>                 p =3D rcu_dereference(head.next);
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
>>  In the example above, foo_update_a() blocks until a grace period elapse=
s.
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
>> @@ -490,7 +499,7 @@ have an rcu_head structure added, perhaps as follows=
:
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
>> @@ -659,6 +669,7 @@ This section presents a "toy" RCU implementation tha=
t
>> is based on
>>  on features such as hotplug CPU and the ability to run in CONFIG_PREEMP=
T
>>  kernels.  The definitions of rcu_dereference() and rcu_assign_pointer()
>>  are the same as those shown in the preceding section, so they are
>> omitted.
>> +::
>>
>>         void rcu_read_lock(void) { }
>>
>> @@ -707,10 +718,12 @@ Quick Quiz #3:  If it is illegal to block in an RC=
U
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
>> - 8     if (p->key =3D=3D key) {             8     if (p->key =3D=3D key=
) {
>> - 9       *result =3D p->data;             9       *result =3D p->data;
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
>> - 6   list_for_each_entry(p, head, lp) { 6   list_for_each_entry(p, head=
,
>> lp) {
>> - 7     if (p->key =3D=3D key) {             7     if (p->key =3D=3D key=
) {
>> - 8       list_del(&p->list);            8       list_del_rcu(&p->list);
>> - 9       write_unlock(&listmutex);      9       spin_unlock(&listmutex)=
;
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
>> +  8     if (p->key =3D=3D key) {             8     if (p->key =3D=3D ke=
y) {
>> +  9       *result =3D p->data;             9       *result =3D p->data;
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
>> +  7     if (p->key =3D=3D key) {             7     if (p->key =3D=3D ke=
y) {
>> +  8       list_del(&p->list);            8       list_del_rcu(&p->list)=
;
>> +  9       write_unlock(&listmutex);      9       spin_unlock(&listmutex=
);
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
> The same applies to all other quick quiz questions in this document and i=
n
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
>> Linux-kernel-mentees@lists.linuxfoundation.org
>> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
>>
> =E1=90=A7
>

--0000000000000be2e305965bd6bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Nov 2, 2019 at 3:31 PM Madhuparna=
 Bhowmik &lt;<a href=3D"mailto:madhuparnabhowmik04@gmail.com">madhuparnabho=
wmik04@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>I reviewed=
 this patch, and I have the following suggestions:</div><br></div></blockqu=
ote><div>Thank for feedback. I did some change adding the cross-ref. patch =
sent</div><div>also apply in rcu-dev branch.</div><div><br></div><div><a hr=
ef=3D"https://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/2019=
-November/001019.html">https://lists.linuxfoundation.org/pipermail/linux-ke=
rnel-mentees/2019-November/001019.html</a></div><div><br></div><div>Regards=
,</div><div>Phong.=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Oct 31, 2019 at 5:04 AM Phong Tran &lt;<a href=3D=
"mailto:tranmanphong@gmail.com" target=3D"_blank">tranmanphong@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Syn=
c the format with current state of kernel documentation.<br>
This change base on rcu-dev branch<br>
what changed:<br>
- Format bullet lists<br>
- Add literal blocks<br>
<br>
Signed-off-by: Phong Tran &lt;<a href=3D"mailto:tranmanphong@gmail.com" tar=
get=3D"_blank">tranmanphong@gmail.com</a>&gt;<br>
---<br>
=C2=A0Documentation/RCU/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../RCU/{whatisRCU.txt =3D&gt; whatisRCU.rst}=C2=A0 =C2=A0 =C2=A0 | 1=
50 +++++++++++-------<br>
=C2=A02 files changed, 90 insertions(+), 61 deletions(-)<br>
=C2=A0rename Documentation/RCU/{whatisRCU.txt =3D&gt; whatisRCU.rst} (91%)<=
br>
<br>
diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst<br>
index 627128c230dc..b9b11481c727 100644<br>
--- a/Documentation/RCU/index.rst<br>
+++ b/Documentation/RCU/index.rst<br>
@@ -8,6 +8,7 @@ RCU concepts<br>
=C2=A0 =C2=A0 :maxdepth: 3<br>
<br>
=C2=A0 =C2=A0 arrayRCU<br>
+=C2=A0 =C2=A0whatisRCU<br>
=C2=A0 =C2=A0 rcu<br>
=C2=A0 =C2=A0 listRCU<br>
=C2=A0 =C2=A0 NMI-RCU<br>
diff --git a/Documentation/RCU/whatisRCU.txt b/Documentation/RCU/whatisRCU.=
rst<br>
similarity index 91%<br>
rename from Documentation/RCU/whatisRCU.txt<br>
rename to Documentation/RCU/whatisRCU.rst<br>
index 58ba05c4d97f..70d0e4c21917 100644<br>
--- a/Documentation/RCU/whatisRCU.txt<br>
+++ b/Documentation/RCU/whatisRCU.rst<br>
@@ -1,15 +1,18 @@<br>
+.. _rcu_doc:<br>
+<br>
=C2=A0What is RCU?=C2=A0 --=C2=A0 &quot;Read, Copy, Update&quot;<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
=C2=A0Please note that the &quot;What is RCU?&quot; LWN series is an excell=
ent place<br>
=C2=A0to start learning about RCU:<br>
<br>
-1.=C2=A0 =C2=A0 =C2=A0What is RCU, Fundamentally?=C2=A0 <a href=3D"http://=
lwn.net/Articles/262464/" rel=3D"noreferrer" target=3D"_blank">http://lwn.n=
et/Articles/262464/</a><br>
-2.=C2=A0 =C2=A0 =C2=A0What is RCU? Part 2: Usage=C2=A0 =C2=A0<a href=3D"ht=
tp://lwn.net/Articles/263130/" rel=3D"noreferrer" target=3D"_blank">http://=
lwn.net/Articles/263130/</a><br>
-3.=C2=A0 =C2=A0 =C2=A0RCU part 3: the RCU API=C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://lwn.net/Articles/264090/" rel=3D"noreferrer" target=3D"_blank">h=
ttp://lwn.net/Articles/264090/</a><br>
-4.=C2=A0 =C2=A0 =C2=A0The RCU API, 2010 Edition=C2=A0 =C2=A0 <a href=3D"ht=
tp://lwn.net/Articles/418853/" rel=3D"noreferrer" target=3D"_blank">http://=
lwn.net/Articles/418853/</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A02010 Big API Table=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<a href=3D"http://lwn.net/Articles/419086/" rel=3D"noreferrer"=
 target=3D"_blank">http://lwn.net/Articles/419086/</a><br>
-5.=C2=A0 =C2=A0 =C2=A0The RCU API, 2014 Edition=C2=A0 =C2=A0 <a href=3D"ht=
tp://lwn.net/Articles/609904/" rel=3D"noreferrer" target=3D"_blank">http://=
lwn.net/Articles/609904/</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A02014 Big API Table=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<a href=3D"http://lwn.net/Articles/609973/" rel=3D"noreferrer"=
 target=3D"_blank">http://lwn.net/Articles/609973/</a><br>
+| 1.=C2=A0 =C2=A0What is RCU, Fundamentally?=C2=A0 <a href=3D"http://lwn.n=
et/Articles/262464/" rel=3D"noreferrer" target=3D"_blank">http://lwn.net/Ar=
ticles/262464/</a><br>
+| 2.=C2=A0 =C2=A0What is RCU? Part 2: Usage=C2=A0 =C2=A0<a href=3D"http://=
lwn.net/Articles/263130/" rel=3D"noreferrer" target=3D"_blank">http://lwn.n=
et/Articles/263130/</a><br>
+| 3.=C2=A0 =C2=A0RCU part 3: the RCU API=C2=A0 =C2=A0 =C2=A0 <a href=3D"ht=
tp://lwn.net/Articles/264090/" rel=3D"noreferrer" target=3D"_blank">http://=
lwn.net/Articles/264090/</a><br>
+| 4.=C2=A0 =C2=A0The RCU API, 2010 Edition=C2=A0 =C2=A0 <a href=3D"http://=
lwn.net/Articles/418853/" rel=3D"noreferrer" target=3D"_blank">http://lwn.n=
et/Articles/418853/</a><br>
+|=C2=A0 =C2=A0 =C2=A0 2010 Big API Table=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0<a href=3D"http://lwn.net/Articles/419086/" rel=3D"noreferrer" targe=
t=3D"_blank">http://lwn.net/Articles/419086/</a><br>
+| 5.=C2=A0 =C2=A0The RCU API, 2014 Edition=C2=A0 =C2=A0 <a href=3D"http://=
lwn.net/Articles/609904/" rel=3D"noreferrer" target=3D"_blank">http://lwn.n=
et/Articles/609904/</a><br>
+|=C2=A0 =C2=A0 =C2=A0 2014 Big API Table=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0<a href=3D"http://lwn.net/Articles/609973/" rel=3D"noreferrer" targe=
t=3D"_blank">http://lwn.net/Articles/609973/</a><br><br></blockquote><div><=
br></div><div>Adding an external link here would be better.</div><div>like =
this :=C2=A0=C2=A0<span style=3D"font-family:Menlo,Monaco,Consolas,&quot;Co=
urier New&quot;,monospace;font-size:13px;box-sizing:border-box;color:rgb(64=
,112,160)">`text=C2=A0</span><span style=3D"font-family:Menlo,Monaco,Consol=
as,&quot;Courier New&quot;,monospace;font-size:13px;box-sizing:border-box;c=
olor:rgb(112,160,208);font-style:italic">&lt;link URL&gt;</span><span style=
=3D"font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;fon=
t-size:13px;box-sizing:border-box;color:rgb(64,112,160)">`_</span>=C2=A0</d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0What is RCU?<br>
@@ -51,6 +54,7 @@ never need this document anyway.=C2=A0 ;-)<br>
<br>
<br></blockquote><div><br></div><div>There is a list of topics that are cov=
ered in this documentation.</div><div>Like this:</div><div><br></div><div>1=
. RCU OVERVIEW<br>2. WHAT IS RCU=E2=80=99S CORE API?<br>3. WHAT ARE SOME EX=
AMPLE USES OF CORE RCU API?<br>4. WHAT IF MY UPDATING THREAD CANNOT BLOCK?<=
br></div><div>...</div><div><br></div><div>=C2=A0since this document is qui=
te big adding cross-references to the above would be helpful.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A01.=C2=A0 RCU OVERVIEW<br>
+----------------<br>
<br>
=C2=A0The basic idea behind RCU is to split updates into &quot;removal&quot=
; and<br>
=C2=A0&quot;reclamation&quot; phases.=C2=A0 The removal phase removes refer=
ences to data items<br>
@@ -118,6 +122,7 @@ Read on to learn about how RCU&#39;s API makes this eas=
y.<br>
<br>
<br>
=C2=A02.=C2=A0 WHAT IS RCU&#39;S CORE API?<br>
+---------------------------<br>
<br>
=C2=A0The core RCU API is quite small:<br>
<br>
@@ -166,7 +171,7 @@ synchronize_rcu()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 read-side critical sections on all CPUs have co=
mpleted.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Note that synchronize_rcu() will -not- necessar=
ily wait for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 any subsequent RCU read-side critical sections =
to complete.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0For example, consider the following sequence of=
 events:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0For example, consider the following sequence of=
 events::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU 0=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPU 1=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU 2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0----------------- ---------=
---------------- ---------------<br>
@@ -248,13 +253,13 @@ rcu_dereference()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Common coding practice uses rcu_dereference() t=
o copy an<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 RCU-protected pointer to a local variable, then=
 dereferences<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0this local variable, for example as follows:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0this local variable, for example as follows::<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D rcu_dereferen=
ce(head.next);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return p-&gt;data;<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 However, in this case, one could just as easily=
 combine these<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0into one statement:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0into one statement::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rcu_derefere=
nce(head.next)-&gt;data;<br>
<br>
@@ -267,7 +272,7 @@ rcu_dereference()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Note that the value returned by rcu_dereference=
() is valid<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 only within the enclosing RCU read-side critica=
l section [1].<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0For example, the following is -not- legal:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0For example, the following is -not- legal::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_read_lock();<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D rcu_dereferen=
ce(head.next);<br>
@@ -315,6 +320,7 @@ rcu_dereference()<br>
<br>
=C2=A0The following diagram shows how each API communicates among the<br>
=C2=A0reader, updater, and reclaimer.<br>
+::<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_assign_pointer()<br>
@@ -377,10 +383,12 @@ for specialized uses, but are relatively uncommon.<br=
>
<br>
<br>
=C2=A03.=C2=A0 WHAT ARE SOME EXAMPLE USES OF CORE RCU API?<br>
+-----------------------------------------------<br>
<br>
=C2=A0This section shows a simple use of the core RCU API to protect a<br>
=C2=A0global pointer to a dynamically allocated structure.=C2=A0 More-typic=
al<br>
=C2=A0uses of RCU may be found in listRCU.txt, arrayRCU.txt, and NMI-RCU.tx=
t.<br>
+::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct foo {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int a;<br>
@@ -467,13 +475,14 @@ arrayRCU.txt, and NMI-RCU.txt.<br>
<br>
<br>
=C2=A04.=C2=A0 WHAT IF MY UPDATING THREAD CANNOT BLOCK?<br>
+--------------------------------------------<br>
<br>
=C2=A0In the example above, foo_update_a() blocks until a grace period elap=
ses.<br>
=C2=A0This is quite simple, but in some cases one cannot afford to wait so<=
br>
=C2=A0long -- there might be other high-priority work to be done.<br>
<br>
=C2=A0In such cases, one uses call_rcu() rather than synchronize_rcu().<br>
-The call_rcu() API is as follows:<br>
+The call_rcu() API is as follows::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void call_rcu(struct rcu_head * head,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 void (*func)(struct rcu_head *head));<br>
@@ -481,7 +490,7 @@ The call_rcu() API is as follows:<br>
=C2=A0This function invokes func(head) after a grace period has elapsed.<br=
>
=C2=A0This invocation might happen from either softirq or process context,<=
br>
=C2=A0so the function is not permitted to block.=C2=A0 The foo struct needs=
 to<br>
-have an rcu_head structure added, perhaps as follows:<br>
+have an rcu_head structure added, perhaps as follows::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct foo {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int a;<br>
@@ -490,7 +499,7 @@ have an rcu_head structure added, perhaps as follows:<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct rcu_head rcu=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
-The foo_update_a() function might then be written as follows:<br>
+The foo_update_a() function might then be written as follows::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Create a new struct foo that is the sam=
e as the one currently<br>
@@ -520,7 +529,7 @@ The foo_update_a() function might then be written as fo=
llows:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 call_rcu(&amp;old_f=
p-&gt;rcu, foo_reclaim);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-The foo_reclaim() function might appear as follows:<br>
+The foo_reclaim() function might appear as follows::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void foo_reclaim(struct rcu_head *rp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
@@ -552,7 +561,7 @@ o=C2=A0 =C2=A0Use call_rcu() -after- removing a data el=
ement from an<br>
<br>
=C2=A0If the callback for call_rcu() is not doing anything more than callin=
g<br>
=C2=A0kfree() on the structure, you can use kfree_rcu() instead of call_rcu=
()<br>
-to avoid having to write your own callback:<br>
+to avoid having to write your own callback::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree_rcu(old_fp, rcu);<br>
<br>
@@ -560,6 +569,7 @@ Again, see checklist.txt for additional rules governing=
 the use of RCU.<br>
<br>
<br>
=C2=A05.=C2=A0 WHAT ARE SOME SIMPLE IMPLEMENTATIONS OF RCU?<br>
+------------------------------------------------<br>
<br>
=C2=A0One of the nice things about RCU is that it has extremely simple &quo=
t;toy&quot;<br>
=C2=A0implementations that are a good first step towards understanding the<=
br>
@@ -591,7 +601,7 @@ you allow nested rcu_read_lock() calls, you can deadloc=
k.<br>
=C2=A0However, it is probably the easiest implementation to relate to, so i=
s<br>
=C2=A0a good starting point.<br>
<br>
-It is extremely simple:<br>
+It is extremely simple::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 static DEFINE_RWLOCK(rcu_gp_mutex);<br>
<br>
@@ -614,7 +624,7 @@ It is extremely simple:<br>
<br>
=C2=A0[You can ignore rcu_assign_pointer() and rcu_dereference() without mi=
ssing<br>
=C2=A0much.=C2=A0 But here are simplified versions anyway.=C2=A0 And whatev=
er you do,<br>
-don&#39;t forget about them when submitting patches making use of RCU!]<br=
>
+don&#39;t forget about them when submitting patches making use of RCU!]::<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #define rcu_assign_pointer(p, v) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ({ \<br>
@@ -659,6 +669,7 @@ This section presents a &quot;toy&quot; RCU implementat=
ion that is based on<br>
=C2=A0on features such as hotplug CPU and the ability to run in CONFIG_PREE=
MPT<br>
=C2=A0kernels.=C2=A0 The definitions of rcu_dereference() and rcu_assign_po=
inter()<br>
=C2=A0are the same as those shown in the preceding section, so they are omi=
tted.<br>
+::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void rcu_read_lock(void) { }<br>
<br>
@@ -707,10 +718,12 @@ Quick Quiz #3:=C2=A0 If it is illegal to block in an =
RCU read-side<br>
<br>
<br>
=C2=A06.=C2=A0 ANALOGY WITH READER-WRITER LOCKING<br>
+--------------------------------------<br>
<br>
=C2=A0Although RCU can be used in many different ways, a very common use of=
<br>
=C2=A0RCU is analogous to reader-writer locking.=C2=A0 The following unifie=
d<br>
=C2=A0diff shows how closely related RCU and reader-writer locking can be.<=
br>
+::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -5,5 +5,5 @@ struct el {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int data;<br>
@@ -762,7 +775,7 @@ diff shows how closely related RCU and reader-writer lo=
cking can be.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-Or, for those who prefer a side-by-side listing:<br>
+Or, for those who prefer a side-by-side listing::<br>
<br>
=C2=A0 1 struct el {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 struct el {<br>
=C2=A0 2=C2=A0 =C2=A0struct list_head list;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0struct list_head list;<br>
@@ -774,40 +787,44 @@ Or, for those who prefer a side-by-side listing:<br>
=C2=A0 8 rwlock_t listmutex;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 8 spinlock_t listmutex;<br>
=C2=A0 9 struct el head;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 9 struct el head;<br>
<br>
- 1 int search(long key, int *result)=C2=A0 =C2=A0 1 int search(long key, i=
nt *result)<br>
- 2 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2 {<br>
- 3=C2=A0 =C2=A0struct list_head *lp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 3=C2=A0 =C2=A0struct list_head *lp;<br>
- 4=C2=A0 =C2=A0struct el *p;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4=C2=A0 =C2=A0struct el *p;<br>
- 5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5<br>
- 6=C2=A0 =C2=A0read_lock(&amp;listmutex);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A06=C2=A0 =C2=A0rcu_read_lock();<br>
- 7=C2=A0 =C2=A0list_for_each_entry(p, head, lp) { 7=C2=A0 =C2=A0list_for_e=
ach_entry_rcu(p, head, lp) {<br>
- 8=C2=A0 =C2=A0 =C2=A0if (p-&gt;key =3D=3D key) {=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A08=C2=A0 =C2=A0 =C2=A0if (p-&gt;key =3D=3D key) {<br=
>
- 9=C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D p-&gt;data;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A09=C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D p-&gt;da=
ta;<br>
-10=C2=A0 =C2=A0 =C2=A0 =C2=A0read_unlock(&amp;listmutex);=C2=A0 =C2=A0 =C2=
=A0 10=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_unlock();<br>
-11=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011=C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n 1;<br>
-12=C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012=C2=A0 =C2=
=A0 =C2=A0}<br>
-13=C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013=C2=A0 =C2=
=A0}<br>
-14=C2=A0 =C2=A0read_unlock(&amp;listmutex);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 14=C2=A0 =C2=A0rcu_read_unlock();<br>
-15=C2=A0 =C2=A0return 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A015=C2=A0 =C2=A0return 0;<br>
-16 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016 }<br>
-<br>
- 1 int delete(long key)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A01 int delete(long key)<br>
- 2 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2 {<br>
- 3=C2=A0 =C2=A0struct el *p;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3=C2=A0 =C2=A0struct el *p;<br>
- 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4<br>
- 5=C2=A0 =C2=A0write_lock(&amp;listmutex);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 5=C2=A0 =C2=A0spin_lock(&amp;listmutex);<br>
- 6=C2=A0 =C2=A0list_for_each_entry(p, head, lp) { 6=C2=A0 =C2=A0list_for_e=
ach_entry(p, head, lp) {<br>
- 7=C2=A0 =C2=A0 =C2=A0if (p-&gt;key =3D=3D key) {=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A07=C2=A0 =C2=A0 =C2=A0if (p-&gt;key =3D=3D key) {<br=
>
- 8=C2=A0 =C2=A0 =C2=A0 =C2=A0list_del(&amp;p-&gt;list);=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 8=C2=A0 =C2=A0 =C2=A0 =C2=A0list_del_rcu(&amp;p-&g=
t;list);<br>
- 9=C2=A0 =C2=A0 =C2=A0 =C2=A0write_unlock(&amp;listmutex);=C2=A0 =C2=A0 =
=C2=A0 9=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;listmutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A010=C2=A0 =
=C2=A0 =C2=A0 =C2=A0synchronize_rcu();<br>
-10=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(p);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree=
(p);<br>
-11=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012=C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n 1;<br>
-12=C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013=C2=A0 =C2=
=A0 =C2=A0}<br>
-13=C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A014=C2=A0 =C2=
=A0}<br>
-14=C2=A0 =C2=A0write_unlock(&amp;listmutex);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A015=C2=A0 =C2=A0spin_unlock(&amp;listmutex);<br>
-15=C2=A0 =C2=A0return 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016=C2=A0 =C2=A0return 0;<br>
-16 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A017 }<br>
+::<br>
+<br>
+=C2=A0 1 int search(long key, int *result)=C2=A0 =C2=A0 1 int search(long =
key, int *result)<br>
+=C2=A0 2 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2 {<br>
+=C2=A0 3=C2=A0 =C2=A0struct list_head *lp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 3=C2=A0 =C2=A0struct list_head *lp;<br>
+=C2=A0 4=C2=A0 =C2=A0struct el *p;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4=C2=A0 =C2=A0struct el *p;<br>
+=C2=A0 5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5<br>
+=C2=A0 6=C2=A0 =C2=A0read_lock(&amp;listmutex);=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A06=C2=A0 =C2=A0rcu_read_lock();<br>
+=C2=A0 7=C2=A0 =C2=A0list_for_each_entry(p, head, lp) { 7=C2=A0 =C2=A0list=
_for_each_entry_rcu(p, head, lp) {<br>
+=C2=A0 8=C2=A0 =C2=A0 =C2=A0if (p-&gt;key =3D=3D key) {=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08=C2=A0 =C2=A0 =C2=A0if (p-&gt;key =3D=3D ke=
y) {<br>
+=C2=A0 9=C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D p-&gt;data;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A09=C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D p=
-&gt;data;<br>
+ 10=C2=A0 =C2=A0 =C2=A0 =C2=A0read_unlock(&amp;listmutex);=C2=A0 =C2=A0 =
=C2=A0 10=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_unlock();<br>
+ 11=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011=C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n 1;<br>
+ 12=C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012=C2=A0 =C2=
=A0 =C2=A0}<br>
+ 13=C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013=C2=A0 =C2=
=A0}<br>
+ 14=C2=A0 =C2=A0read_unlock(&amp;listmutex);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 14=C2=A0 =C2=A0rcu_read_unlock();<br>
+ 15=C2=A0 =C2=A0return 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A015=C2=A0 =C2=A0return 0;<br>
+ 16 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016 }<br>
+<br>
+::<br>
+<br>
+=C2=A0 1 int delete(long key)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A01 int delete(long key)<br>
+=C2=A0 2 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2 {<br>
+=C2=A0 3=C2=A0 =C2=A0struct el *p;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3=C2=A0 =C2=A0struct el *p;<br>
+=C2=A0 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4<br>
+=C2=A0 5=C2=A0 =C2=A0write_lock(&amp;listmutex);=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 5=C2=A0 =C2=A0spin_lock(&amp;listmutex);<br>
+=C2=A0 6=C2=A0 =C2=A0list_for_each_entry(p, head, lp) { 6=C2=A0 =C2=A0list=
_for_each_entry(p, head, lp) {<br>
+=C2=A0 7=C2=A0 =C2=A0 =C2=A0if (p-&gt;key =3D=3D key) {=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07=C2=A0 =C2=A0 =C2=A0if (p-&gt;key =3D=3D ke=
y) {<br>
+=C2=A0 8=C2=A0 =C2=A0 =C2=A0 =C2=A0list_del(&amp;p-&gt;list);=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8=C2=A0 =C2=A0 =C2=A0 =C2=A0list_del_rcu(&amp;=
p-&gt;list);<br>
+=C2=A0 9=C2=A0 =C2=A0 =C2=A0 =C2=A0write_unlock(&amp;listmutex);=C2=A0 =C2=
=A0 =C2=A0 9=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;listmutex);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10=C2=A0=
 =C2=A0 =C2=A0 =C2=A0synchronize_rcu();<br>
+ 10=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(p);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree=
(p);<br>
+ 11=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012=C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n 1;<br>
+ 12=C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013=C2=A0 =C2=
=A0 =C2=A0}<br>
+ 13=C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A014=C2=A0 =C2=
=A0}<br>
+ 14=C2=A0 =C2=A0write_unlock(&amp;listmutex);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A015=C2=A0 =C2=A0spin_unlock(&amp;listmutex);<br>
+ 15=C2=A0 =C2=A0return 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016=C2=A0 =C2=A0return 0;<br>
+ 16 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A017 }<br>
<br>
=C2=A0Either way, the differences are quite small.=C2=A0 Read-side locking =
moves<br>
=C2=A0to rcu_read_lock() and rcu_read_unlock, update-side locking moves fro=
m<br>
@@ -827,13 +844,14 @@ be used in place of synchronize_rcu().<br>
<br>
<br>
=C2=A07.=C2=A0 FULL LIST OF RCU APIs<br>
+-------------------------<br>
<br>
=C2=A0The RCU APIs are documented in docbook-format header comments in the<=
br>
=C2=A0Linux-kernel source code, but it helps to have a full list of the<br>
=C2=A0APIs, since there does not appear to be a way to categorize them<br>
=C2=A0in docbook.=C2=A0 Here is the list, by category.<br>
<br>
-RCU list traversal:<br>
+RCU list traversal::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 list_entry_rcu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 list_first_entry_rcu<br>
@@ -854,7 +872,7 @@ RCU list traversal:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hlist_bl_first_rcu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hlist_bl_for_each_entry_rcu<br>
<br>
-RCU pointer/list update:<br>
+RCU pointer/list udate::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_assign_pointer<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 list_add_rcu<br>
@@ -876,7 +894,9 @@ RCU pointer/list update:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hlist_bl_del_rcu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hlist_bl_set_first_rcu<br>
<br>
-RCU:=C2=A0 =C2=A0Critical sections=C2=A0 =C2=A0 =C2=A0 =C2=A0Grace period=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
+RCU::<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Critical sections=C2=A0 =C2=A0 =C2=A0 =C2=A0Gra=
ce period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_read_lock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0synchronize_net=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_barrier<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_read_unlock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0synchronize_rcu<br>
@@ -885,7 +905,9 @@ RCU:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Critical sections=C2=A0=
 =C2=A0 =C2=A0 =C2=A0Grace period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
Barrier<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_dereference_check=C2=A0 =C2=A0kfree_rcu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_dereference_protected<br>
<br>
-bh:=C2=A0 =C2=A0 Critical sections=C2=A0 =C2=A0 =C2=A0 =C2=A0Grace period=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
+bh::<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Critical sections=C2=A0 =C2=A0 =C2=A0 =C2=A0Gra=
ce period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_read_lock_bh=C2=A0 =C2=A0 =C2=A0 =C2=A0 cal=
l_rcu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_barrier<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_read_unlock_bh=C2=A0 =C2=A0 =C2=A0 synchron=
ize_rcu<br>
@@ -896,7 +918,9 @@ bh: Critical sections=C2=A0 =C2=A0 =C2=A0 =C2=A0Grace p=
eriod=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_dereference_bh_protected<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_read_lock_bh_held<br>
<br>
-sched: Critical sections=C2=A0 =C2=A0 =C2=A0 =C2=A0Grace period=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
+sched::<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Critical sections=C2=A0 =C2=A0 =C2=A0 =C2=A0Gra=
ce period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_read_lock_sched=C2=A0 =C2=A0 =C2=A0call_rcu=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_barrier<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_read_unlock_sched=C2=A0 =C2=A0synchronize_r=
cu<br>
@@ -910,7 +934,9 @@ sched:=C2=A0 =C2=A0 =C2=A0 Critical sections=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Grace period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barr=
ier<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_read_lock_sched_held<br>
<br>
<br>
-SRCU:=C2=A0 Critical sections=C2=A0 =C2=A0 =C2=A0 =C2=A0Grace period=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
+SRCU::<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Critical sections=C2=A0 =C2=A0 =C2=A0 =C2=A0Gra=
ce period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcu_read_lock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 call_srcu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcu_ba=
rrier<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcu_read_unlock=C2=A0 =C2=A0 =C2=A0 =C2=A0 syn=
chronize_srcu<br>
@@ -918,13 +944,14 @@ SRCU:=C2=A0 =C2=A0 =C2=A0Critical sections=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Grace period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barr=
ier<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcu_dereference_check<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcu_read_lock_held<br>
<br>
-SRCU:=C2=A0 Initialization/cleanup<br>
+SRCU: Initialization/cleanup::<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DEFINE_SRCU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DEFINE_STATIC_SRCU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 init_srcu_struct<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cleanup_srcu_struct<br>
<br>
-All:=C2=A0 lockdep-checked RCU-protected pointer access<br>
+All: lockdep-checked RCU-protected pointer access::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_access_pointer<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_dereference_raw<br>
@@ -976,6 +1003,7 @@ the right tool for your job.<br>
<br>
<br>
=C2=A08.=C2=A0 ANSWERS TO QUICK QUIZZES<br>
+----------------------------<br>
<br>
=C2=A0Quick Quiz #1: Why is this argument naive?=C2=A0 How could a deadlock=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 occur when using th=
is algorithm in a real-world Linux<br></blockquote><div><br></div><div>Here=
, the formatting is not proper. In the rst file, the question should be add=
ed in the next line after Quick Quiz #1. Currently, half of the question ap=
pears in bold and the rest half does not.</div><div>Also, as followed in al=
l the documents there should be a cross-reference to the answer to this que=
stion. As this document is quite big having references would be helpful.</d=
iv><div>The same applies to all other quick quiz questions in this document=
 and in the Answers section as well the questions do not appear properly, h=
alf in bold text and half not bold.</div><div><br></div><div>Apart from thi=
s, the other added changes look good!</div><div><br></div><div>Thank you</d=
iv><div>Madhuparna</div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
-- <br>
2.20.1<br>
<br>
_______________________________________________<br>
Linux-kernel-mentees mailing list<br>
<a href=3D"mailto:Linux-kernel-mentees@lists.linuxfoundation.org" target=3D=
"_blank">Linux-kernel-mentees@lists.linuxfoundation.org</a><br>
<a href=3D"https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-=
mentees" rel=3D"noreferrer" target=3D"_blank">https://lists.linuxfoundation=
.org/mailman/listinfo/linux-kernel-mentees</a><br>
</blockquote></div></div><div hspace=3D"streak-pt-mark" style=3D"max-height=
:1px"><img alt=3D"" style=3D"width: 0px; max-height: 0px; overflow: hidden;=
" src=3D"https://mailfoogae.appspot.com/t?sender=3DabWFkaHVwYXJuYWJob3dtaWs=
wNEBnbWFpbC5jb20%3D&amp;type=3Dzerocontent&amp;guid=3D8fec4e47-6422-4486-a3=
03-a30685f7265d"><font color=3D"#ffffff" size=3D"1">=E1=90=A7</font></div>
</blockquote></div></div>

--0000000000000be2e305965bd6bd--

--===============8788838115013394139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8788838115013394139==--
