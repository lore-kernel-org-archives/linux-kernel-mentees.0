Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D81C1747C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 14:33:54 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FC7621882
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 14:33:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qHeUbEs5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FC7621882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1605C1020;
	Tue,  5 Nov 2019 14:33:54 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 53B92B8F
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 14:33:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B0907189
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 14:33:51 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id g9so9532415plp.3
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 05 Nov 2019 06:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=v9fSyXnD8VoBgR79So8hf0D54ap7pnniJE6V+L+tQj0=;
	b=qHeUbEs5ZbZVVULeSA39KYSidcTsRbR5Xirdtc8fxiFoKykcH3wQ8vfEuL6QDLKvhF
	0tiKuj1LbgO9R8awW91Cu3uKuBhhlpV2hIV2fn3olyOTIMZ7ge5mV1Edo9sICpopyku/
	jiZJ1vCUPKBwRYSUW70pTn/QmUQUBkPVHjiMy4FanRHThE+YsCZDf/gicMngIjGXZ17T
	WezON4f78514a31zoOEvALzZ+ClZqjOZfMdQ2tqv1Z+98PU1F+Z4ipjoVjZrG8Unz2As
	LO/85B0+t27RXybCEigoWbbbbt0D7RRg6VU4kB7eJ54UCWhZPbYmSmYcpdzM7Ov4lcoV
	57dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=v9fSyXnD8VoBgR79So8hf0D54ap7pnniJE6V+L+tQj0=;
	b=pD12FHbKmzWQkUNke+fnUclibzp1X2jiGq8ufh3UG0zETELSnc3EgHJoh4ZYLT7Zq9
	eOl5mXWjUdhl6kyhgSGGek8F1C4GxvX8+57jnEdghRNHfX7CHpmT4mMU5/4Zy5itJmcX
	5dOX8dPLBhxtMbb/u1S4I2NR/RusEh7hi8+lTLP2FXx0pFujQhzF+kx1IqrEePvVoOiC
	6Fj8+zzW7Xb+3Zf7TZ5cgm0jnBFR5qHl6uICX5oYARMKbwn2ff+VR+mCENQbNUeqXhCB
	xHVuUIyR+ADztSFYBfSX/xDX2tuh0PvbrX4Z+VM3551fcc0KWCpY9ohpalXctRn67tc2
	sQjg==
X-Gm-Message-State: APjAAAViFDC9Pie3fypm2RnSJcIKalk19va0ZmtdjUx+2ZrXTqtdWGjL
	ioKQtoGsBX2rbcGd0wCOBo0=
X-Google-Smtp-Source: APXvYqwYM+PRax7oO1wPn0dsSKHYx6pa9FjEB+WcWxLRXh9HrW1jNeScVrUYBoCAMGUdNcl14Le+UQ==
X-Received: by 2002:a17:902:b40e:: with SMTP id
	x14mr27539445plr.262.1572964431006; 
	Tue, 05 Nov 2019 06:33:51 -0800 (PST)
Received: from workstation ([139.5.253.184]) by smtp.gmail.com with ESMTPSA id
	c12sm25607951pfp.178.2019.11.05.06.33.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 06:33:50 -0800 (PST)
Date: Tue, 5 Nov 2019 20:03:44 +0530
From: Amol Grover <frextrite@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Message-ID: <20191105143344.GA9069@workstation>
References: <20191028202417.13095-1-madhuparnabhowmik04@gmail.com>
	<ac8da2f5-4cda-8985-ff90-061478a4e2c9@gmail.com>
	<20191105140411.GO20975@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105140411.GO20975@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, joel@joelfernandes.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: RCU: arrayRCU:
 Converted arrayRCU.txt to arrayRCU.rst
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

On Tue, Nov 05, 2019 at 06:04:11AM -0800, Paul E. McKenney wrote:
> On Tue, Nov 05, 2019 at 08:49:47PM +0700, Phong Tran wrote:
> > On 10/29/19 3:24 AM, madhuparnabhowmik04@gmail.com wrote:
> > > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > > 
> > > This patch converts arrayRCU from txt to rst format.
> > > arrayRCU.rst is also added in the index.rst file.
> > > 
> > > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > > ---
> > >   .../RCU/{arrayRCU.txt => arrayRCU.rst}         | 18 +++++++++++++-----
> > >   Documentation/RCU/index.rst                    |  1 +
> > >   2 files changed, 14 insertions(+), 5 deletions(-)
> > >   rename Documentation/RCU/{arrayRCU.txt => arrayRCU.rst} (91%)
> > > 
> > > diff --git a/Documentation/RCU/arrayRCU.txt b/Documentation/RCU/arrayRCU.rst
> > > similarity index 91%
> > > rename from Documentation/RCU/arrayRCU.txt
> > > rename to Documentation/RCU/arrayRCU.rst
> > > index f05a9afb2c39..ed5ae24b196e 100644
> > > --- a/Documentation/RCU/arrayRCU.txt
> > > +++ b/Documentation/RCU/arrayRCU.rst
> > > @@ -1,5 +1,7 @@
> > > -Using RCU to Protect Read-Mostly Arrays
> > > +.. _array_rcu_doc:
> > > +Using RCU to Protect Read-Mostly Arrays
> > > +=======================================
> > >   Although RCU is more commonly used to protect linked lists, it can
> > >   also be used to protect arrays.  Three situations are as follows:
> > > @@ -26,6 +28,7 @@ described in the following sections.
> > 
> > It will be better to have the cross reference for each situation.
> > 
> > Hash Tables
> > Static Arrays
> > Resizeable Arrays
> 
> Madhuparna, could you please put a patch together creating these
> cross-references and handling Phong's comments below (probably
> by getting rid of the "." so that the resulting ":" doesn't look
> strange)?
> 
> Then I will fold that patch into your original commit in -rcu and
> add Phong's Tested-by.
> 
> 							Thanx, Paul
> 
> > >   Situation 1: Hash Tables
> > > +------------------------
> > >   Hash tables are often implemented as an array, where each array entry
> > >   has a linked-list hash chain.  Each hash chain can be protected by RCU
> > > @@ -34,6 +37,7 @@ to other array-of-list situations, such as radix trees.
> > >   Situation 2: Static Arrays
> > > +--------------------------
> > >   Static arrays, where the data (rather than a pointer to the data) is
> > >   located in each array element, and where the array is never resized,
> > > @@ -41,11 +45,13 @@ have not been used with RCU.  Rik van Riel recommends using seqlock in
> > >   this situation, which would also have minimal read-side overhead as long
> > >   as updates are rare.
> > > -Quick Quiz:  Why is it so important that updates be rare when
> > > -	     using seqlock?
> > > +Quick Quiz:
> > > +		Why is it so important that updates be rare when using seqlock?
> > > +:ref:`Answer to Quick Quiz <answer_quick_quiz_seqlock>`
> > >   Situation 3: Resizeable Arrays
> > > +------------------------------
> > >   Use of RCU for resizeable arrays is demonstrated by the grow_ary()
> > >   function formerly used by the System V IPC code.  The array is used
> > > @@ -60,7 +66,7 @@ the remainder of the new, updates the ids->entries pointer to point to
> > >   the new array, and invokes ipc_rcu_putref() to free up the old array.
> > >   Note that rcu_assign_pointer() is used to update the ids->entries pointer,
> > >   which includes any memory barriers required on whatever architecture
> > > -you are running on.
> > > +you are running on.::
> > 
> > a redundant ":" in here with html page.
> > 
> > 
> > 
> > 
> > >   	static int grow_ary(struct ipc_ids* ids, int newsize)
> > >   	{
> > > @@ -112,7 +118,7 @@ a simple check suffices.  The pointer to the structure corresponding
> > >   to the desired IPC object is placed in "out", with NULL indicating
> > >   a non-existent entry.  After acquiring "out->lock", the "out->deleted"
> > >   flag indicates whether the IPC object is in the process of being
> > > -deleted, and, if not, the pointer is returned.
> > > +deleted, and, if not, the pointer is returned.::
> > 
> > same as above
> > 
> > 
> > Tested-by: Phong Tran <tranmanphong@gmail.com>
> > 
> > Regards,
> > Phong.
> > 
> > >   	struct kern_ipc_perm* ipc_lock(struct ipc_ids* ids, int id)
> > >   	{
> > > @@ -144,8 +150,10 @@ deleted, and, if not, the pointer is returned.
> > >   		return out;
> > >   	}
> > > +.. _answer_quick_quiz_seqlock:
> > >   Answer to Quick Quiz:
> > > +	Why is it so important that updates be rare when using seqlock?
> > >   	The reason that it is important that updates be rare when
> > >   	using seqlock is that frequent updates can livelock readers.
> > > diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
> > > index 5c99185710fa..8d20d44f8fd4 100644
> > > --- a/Documentation/RCU/index.rst
> > > +++ b/Documentation/RCU/index.rst
> > > @@ -7,6 +7,7 @@ RCU concepts
> > >   .. toctree::
> > >      :maxdepth: 3
> > > +   arrayRCU
> > >      rcu
> > >      listRCU
> > >      UP
> > > 
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Hey,
There are a few instances in the document where words are
emphasized. Example, -not- in the first paragraph. The 
previous emphasis was correct wrt txt format, but this
could be converted to italicize/bold to keep up with the
reST format. Other than this and what Phong suggested,
everything looks good!

Tested-by: Amol Grover <frextrite@gmail.com>

Thank you
Amol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
