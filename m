Return-Path: <SRS0=jt7Q=7C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2A1C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 May 2020 12:44:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E810120758
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 May 2020 12:44:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aE2rroJz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E810120758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C9F2220409;
	Wed, 20 May 2020 12:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7DUbFEg5mEf4; Wed, 20 May 2020 12:44:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8E128204C8;
	Wed, 20 May 2020 12:44:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B281C0894;
	Wed, 20 May 2020 12:44:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 228C5C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 May 2020 08:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 18B1286479
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 May 2020 08:48:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6anrwmFlP6Cj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 May 2020 08:48:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E195186469
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 May 2020 08:48:38 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4BED204EA;
 Tue, 19 May 2020 08:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589878118;
 bh=QqwDjoOdPCa1S0yrdU6lmBnOTcZHTzjUKqn0YdK5F74=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aE2rroJzF99u5k0aFaw11qZQHFSBcILcsPwGsctFhYPqyiBSWcgHSHBZoYPUXH5kI
 iuv2icK5I4bNXbxYGh33ZOkEbt+rRlVwm/tdItvqKohAyGFU6wvRY5J9xTnCkNm88x
 QtxG2Pab/trywmtkcRxzclrH9xaaCGsziupQU00s=
Date: Tue, 19 May 2020 10:48:34 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200519104834.3c4bf5d7@coco.lan>
In-Reply-To: <C564849C-4E08-4994-A694-A736626548E2@getmailspring.com>
References: <20200517022115.5ce8136c@coco.lan>
 <C564849C-4E08-4994-A694-A736626548E2@getmailspring.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 May 2020 12:44:14 +0000
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org\"\"\"
 <linux-kernel-mentees@lists.linuxfoundation.org>"@osuosl.org
Subject: Re: [Linux-kernel-mentees] modprobing 'vidtv' doesn't really do
	anything
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Em Tue, 19 May 2020 04:13:07 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> With your current patch the probing code is actually called now, Mauro. Thanks!
> 
> As for the sparse errors you've pointed out earlier, I'm at a loss. Yes,
> I have noticed them, but let's look at an example (they're all mostly
> the same)
> 
> >SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c
> >drivers/media/test-drivers/vidtv/vidtv_psi.c:174:43: warning: Using plain
> >integer as NULL pointer  
> 
> This actually refers to this line:
> 
> >struct psi_write_args psi_args = {0}  
> 
> Which seems to me like a valid way to zero-initialize a struct in C? 

Actually, passing 0 is not the right thing there. The init code
should either be using gcc style:

	struct psi_write_args psi_args = {}  

or something where the first argument matches the first argument
of the struct, as, according with the C99 specs, doing something
like:

	struct foo {
		void *bar;
		...
	};

	struct psi_write_args psi_args = {NULL};

Would do is to use NULL to initialize "bar" variable. 

See comments about that at https://stackoverflow.com/questions/11152160/initializing-a-struct-to-0:

	"Reference C99 Standard 6.7.8.21:

	If there are fewer initializers in a brace-enclosed list than there are elements or members of an aggregate, or fewer characters in a string literal used to initialize an array of known size than there are elements in the array, the remainder of the aggregate shall be initialized implicitly the same as objects that have static storage duration."

The other values would be initialized with the "same as objects that
have static storage", e. g. with zero.

In other words, you need to check what's the first element of the
struct, when using C99 initialization. E. g, if the first element
is a pointer, the init should be:

	struct some_struct_that_starts_with_a_pointer = {NULL};

Tricky.

> 
> Next up is...
> 
> >SPARSE:drivers/media/test-drivers/vidtv/vidtv_pes.c
> >drivers/media/test-drivers/vidtv/vidtv_pes.c:80:54: warning: missing
> >braces around initializer  
> 
> I assume this refers to the following line, which is the same deal as above.
> 
> >struct vidtv_pes_optional_pts pts         = {0};  
> 
> 
> And then there's this, which is an actual mistake. I have mostly
> eliminated these, but this guy has slipped by.
> 
> >SPARSE:drivers/media/test-drivers/vidtv/vidtv_s302m.c
> >drivers/media/test-drivers/vidtv/vidtv_s302m.c:430:36: warning:
> >incorrect type in assignment (different base types)  
> 
> 
> Just one more thing. This change on vidtv_bridge.c:
> 
> >vidtv_bridge_check_demod_lock(struct vidtv_dvb *dvb, u32 n)
> >
> >dvb->fe[n]->ops.read_status(dvb->fe[n], &status);
> >
> >-	return status == (FE_HAS_SIGNAL |
> >-	FE_HAS_CARRIER |
> >-	FE_HAS_VITERBI |
> >-	FE_HAS_SYNC |
> >-	FE_HAS_LOCK);
> >+	status = FE_HAS_SIGNAL |
> >+	FE_HAS_CARRIER |
> >+	FE_HAS_VITERBI |
> >+	FE_HAS_SYNC |
> >+	FE_HAS_LOCK;
> >+
> >+	return status;
> >}  
> 
> I did not understand that. Why was the boolean expression replaced by an
> assignment? This was so eventually we could drop packets or simulate
> some sort of noise in the event that one of these flags was not set, as
> we've discussed at some point.

Ah, sorry, I remember gcc complained about that (can't remember why).

On a very quick look (it was 2am here when I looked at the code), it
sounded to me  that you wanted to assign status to some value and return
it.

Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
