Return-Path: <SRS0=D7LL=ZE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE87C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 13:36:43 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FF2D21925
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 13:36:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRFGLFQm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FF2D21925
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4D5421430;
	Tue, 12 Nov 2019 13:36:43 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 64C6713B9
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 13:36:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 16E3D8A
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 13:36:42 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (199-192-87-166.static.wiline.com
	[199.192.87.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E4BA82084F;
	Tue, 12 Nov 2019 13:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573565801;
	bh=XX3XVc0MSDw2E2A+jg5k1cCET51VCwMRMUCwPHmsBSI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=kRFGLFQm98n3Dh5st1Un9FmTwKGuS/oC8M6kYI6gcKdAvKVz9g4h8Yk8EZLNOSrZ2
	OT/Fh0FSf79qYiSVQlmhZ1iPO68cUOFjZ0CFDjqJp0C8isui1WOJUthuSjJIRcOI5c
	IOFa5bgdxWLPl1HKUzlSax11Xc10jTIRkXfiq+Ks=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
	id AEF0235227E6; Tue, 12 Nov 2019 05:36:41 -0800 (PST)
Date: Tue, 12 Nov 2019 05:36:41 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Phong Tran <tranmanphong@gmail.com>
Message-ID: <20191112133641.GQ2865@paulmck-ThinkPad-P72>
References: <20191111181122.28083-1-madhuparnabhowmik04@gmail.com>
	<CAD3AR6E486EAJ5EW_Wr4qiPeZU_M7TnDTC0g-CB+=6ob9Ru6mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD3AR6E486EAJ5EW_Wr4qiPeZU_M7TnDTC0g-CB+=6ob9Ru6mQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	Joel Fernandes <joel@joelfernandes.org>, mchehab@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: RCU: whatisRCU:
 Updated full list of RCU API
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

On Tue, Nov 12, 2019 at 07:03:10AM +0700, Phong Tran wrote:
> On Tue, Nov 12, 2019 at 1:12 AM <madhuparnabhowmik04@gmail.com> wrote:
> >
> > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> >
> > This patch updates the list of RCU API in whatisRCU.rst.
> 
> Tested-by: Phong Tran <tranmanphong@gmail.com>

Applied, thanks to all three of you!

							Thanx, Paul

> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > ---
> >  Documentation/RCU/whatisRCU.rst | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
> > index 2f6f6ebbc8b0..c7f147b8034f 100644
> > --- a/Documentation/RCU/whatisRCU.rst
> > +++ b/Documentation/RCU/whatisRCU.rst
> > @@ -884,11 +884,14 @@ in docbook.  Here is the list, by category.
> >  RCU list traversal::
> >
> >         list_entry_rcu
> > +       list_entry_lockless
> >         list_first_entry_rcu
> >         list_next_rcu
> >         list_for_each_entry_rcu
> >         list_for_each_entry_continue_rcu
> >         list_for_each_entry_from_rcu
> > +       list_first_or_null_rcu
> > +       list_next_or_null_rcu
> >         hlist_first_rcu
> >         hlist_next_rcu
> >         hlist_pprev_rcu
> > @@ -902,7 +905,7 @@ RCU list traversal::
> >         hlist_bl_first_rcu
> >         hlist_bl_for_each_entry_rcu
> >
> > -RCU pointer/list udate::
> > +RCU pointer/list update::
> >
> >         rcu_assign_pointer
> >         list_add_rcu
> > @@ -912,10 +915,12 @@ RCU pointer/list udate::
> >         hlist_add_behind_rcu
> >         hlist_add_before_rcu
> >         hlist_add_head_rcu
> > +       hlist_add_tail_rcu
> >         hlist_del_rcu
> >         hlist_del_init_rcu
> >         hlist_replace_rcu
> > -       list_splice_init_rcu()
> > +       list_splice_init_rcu
> > +       list_splice_tail_init_rcu
> >         hlist_nulls_del_init_rcu
> >         hlist_nulls_del_rcu
> >         hlist_nulls_add_head_rcu
> > --
> > 2.17.1
> >
> > _______________________________________________
> > Linux-kernel-mentees mailing list
> > Linux-kernel-mentees@lists.linuxfoundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
