Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F23C17484
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 13:55:31 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB68821D6C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 13:55:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGViaySm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB68821D6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C5875F40;
	Tue,  5 Nov 2019 13:55:30 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 17C3EF3E
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 13:55:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 479EE5D0
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 13:55:27 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (unknown [109.144.209.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BFABF21928;
	Tue,  5 Nov 2019 13:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572962127;
	bh=e4hXWEE6xfVZFRBpznPIiemjVEl8fL/DHbmQ6BJl5t4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=HGViaySmxhzs3jSKe/40Ua3O+E+jcavAMbE9cPr1Mvr9HburDcpM3ZRb2daTYcU+Y
	T/5GtqKtVxhX3uO9/zs3D3Y/AhITpQtugmX2aMidVnkoReboaFUMBqX3CrQ8NvBznj
	c4yytJJZEpg1uA6APNqp4d2UtfX+39xa22CbVmMY=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
	id 5D4C935227C0; Tue,  5 Nov 2019 05:55:24 -0800 (PST)
Date: Tue, 5 Nov 2019 05:55:24 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Phong Tran <tranmanphong@gmail.com>
Message-ID: <20191105135524.GN20975@paulmck-ThinkPad-P72>
References: <20191028214252.17580-1-madhuparnabhowmik04@gmail.com>
	<5bab8828-76e4-c67f-5855-ea4e4f43eaa5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5bab8828-76e4-c67f-5855-ea4e4f43eaa5@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, joel@joelfernandes.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: RCU: NMI-RCU:
 Converted NMI-RCU.txt to NMI-RCU.rst.
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

On Tue, Nov 05, 2019 at 08:40:05PM +0700, Phong Tran wrote:
> On 10/29/19 4:42 AM, madhuparnabhowmik04@gmail.com wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > 
> > This patch converts NMI-RCU from txt to rst format.
> > Also adds NMI-RCU in the index.rst file.
> > 
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > -- >   .../RCU/{NMI-RCU.txt => NMI-RCU.rst}          | 53 ++++++++++---------
> >   Documentation/RCU/index.rst                   |  1 +
> >   2 files changed, 29 insertions(+), 25 deletions(-)
> >   rename Documentation/RCU/{NMI-RCU.txt => NMI-RCU.rst} (73%)
> > 
> > diff --git a/Documentation/RCU/NMI-RCU.txt b/Documentation/RCU/NMI-RCU.rst
> > similarity index 73%
> > rename from Documentation/RCU/NMI-RCU.txt
> > rename to Documentation/RCU/NMI-RCU.rst
> > index 881353fd5bff..da5861f6a433 100644
> > --- a/Documentation/RCU/NMI-RCU.txt
> > +++ b/Documentation/RCU/NMI-RCU.rst
> > @@ -1,4 +1,7 @@
> > +.. _NMI_rcu_doc:
> > +
> >   Using RCU to Protect Dynamic NMI Handlers
> > +=========================================
> >   Although RCU is usually used to protect read-mostly data structures,
> > @@ -9,7 +12,7 @@ work in "arch/x86/oprofile/nmi_timer_int.c" and in
> >   "arch/x86/kernel/traps.c".
> >   The relevant pieces of code are listed below, each followed by a
> > -brief explanation.
> > +brief explanation.::
> there is just a minor ":" redundant in html page.There are some same in this
> patch.
> eg:
>  brief explanation.:
> 
> Other things look good to me.
> 
> Tested-by: Phong Tran <tranmanphong@gmail.com>

Thank you, Phong!

I queued a commit to be squashed into Madhuparna's original as shown below
which adds your Tested-by and attempts a fix.  Does this work for you?

							Thanx, Paul

------------------------------------------------------------------------

commit 2c29f1c481f74f5e5aaaab195042f4df6a0b8119
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Tue Nov 5 05:51:12 2019 -0800

    squash! Documentation: RCU: NMI-RCU: Converted NMI-RCU.txt to NMI-RCU.rst.
    
    [ paulmck: Apply feedback from Phong Tran. ]
    Tested-by: Phong Tran <tranmanphong@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/Documentation/RCU/NMI-RCU.rst b/Documentation/RCU/NMI-RCU.rst
index da5861f..1809583 100644
--- a/Documentation/RCU/NMI-RCU.rst
+++ b/Documentation/RCU/NMI-RCU.rst
@@ -12,7 +12,7 @@ work in "arch/x86/oprofile/nmi_timer_int.c" and in
 "arch/x86/kernel/traps.c".
 
 The relevant pieces of code are listed below, each followed by a
-brief explanation.::
+brief explanation::
 
 	static int dummy_nmi_callback(struct pt_regs *regs, int cpu)
 	{
@@ -21,12 +21,12 @@ brief explanation.::
 
 The dummy_nmi_callback() function is a "dummy" NMI handler that does
 nothing, but returns zero, thus saying that it did nothing, allowing
-the NMI handler to take the default machine-specific action.::
+the NMI handler to take the default machine-specific action::
 
 	static nmi_callback_t nmi_callback = dummy_nmi_callback;
 
 This nmi_callback variable is a global function pointer to the current
-NMI handler.::
+NMI handler::
 
 	void do_nmi(struct pt_regs * regs, long error_code)
 	{
@@ -61,7 +61,7 @@ Quick Quiz:
 
 :ref:`Answer to Quick Quiz <answer_quick_quiz_NMI>`
 
-Back to the discussion of NMI and RCU...::
+Back to the discussion of NMI and RCU::
 
 	void set_nmi_callback(nmi_callback_t callback)
 	{
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
