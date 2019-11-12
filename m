Return-Path: <SRS0=D7LL=ZE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61154C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 00:03:25 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31BCC2184C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 00:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4dSANX8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31BCC2184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EF22CB8E;
	Tue, 12 Nov 2019 00:03:24 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 39A5DB8A
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 00:03:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id ABAF68A9
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 00:03:23 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q70so1179391wme.1
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 11 Nov 2019 16:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C2hJz4lCOfkMCCr9Ga5SGhhISRmp/Zo6cNfw+JBvPD4=;
	b=C4dSANX8A3Iqlp5SW3GLXjgDjn6AiIxum5KhabRQL0u9+NJELsKHGj45sobE7NfEbN
	u09hSXCRTmpfvoFaIdgeRH9JioWuWwZo39JSTIcjveLJvfCZ18V2+RmkwGFj0zRo1GZS
	UFhbxkdk0trUCPfP6M06Ml6LPigGLiBsfI4rhSsMYsMgAOK8jrqY+kSDFQugU6BjJJnO
	KKYfpEvemBg8cKUSiM2PpHRF7in5UmfSoRGNUJ0pMctheHk9e5mpVKp2LLyqOB7/QmxK
	Fp6sClwwusxFR4fYG5BCCaP5kRxadtysU3j2fd3qGQbh7N0SYdongW+pWHgW9yDZp90U
	kIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C2hJz4lCOfkMCCr9Ga5SGhhISRmp/Zo6cNfw+JBvPD4=;
	b=ehwxdt1xUQOPC3SEU4H4dLu+Q/zqy+u98DmzT6bmWJsUSs/lIOLZsnz/Q0VR207DBl
	VIG+5ieWANWlUH617I0PFHBjn/YNYth+CgxdmrQj/SPgZ7shVV1yAo6SZH/K0ksqfWEG
	1rMTEhvujWE6h78b6rtG5X/gJO0OgaEnQma1DcMKudi5PbDh+TAsRgyXv9aErbcFM5Gs
	1c5LNmoPLuS8UhzKzYfbYvWJR0aPvOJHJfnzfh0lPF7OQxrI9CawEDrLfnH0Cmgenv6l
	2SbbGDWCjrcte9U8+6LtRbgaFlrapleFNOaAlHJbiMyPi74UMp5Kvwd87cd8OA3SkMeg
	QRZg==
X-Gm-Message-State: APjAAAX5OTRvtLfQ8TcS9bfnuO2b2rAN4wMrl70OJ0MzfAVgO2PgQ9C3
	eMInkg8u7oiQ+r5hDCnk6+WDFAAI0dwpenGsM9o=
X-Google-Smtp-Source: APXvYqx3qSAucNJ8c2QmwKh+XFtnsSnVSsWogTf4eRg+5fTby7qdsdZaAXPlJz2/DRqoC7NEHbalVcg4b1liF2DPg2w=
X-Received: by 2002:a1c:6405:: with SMTP id y5mr1369685wmb.175.1573517002088; 
	Mon, 11 Nov 2019 16:03:22 -0800 (PST)
MIME-Version: 1.0
References: <20191111181122.28083-1-madhuparnabhowmik04@gmail.com>
In-Reply-To: <20191111181122.28083-1-madhuparnabhowmik04@gmail.com>
From: Phong Tran <tranmanphong@gmail.com>
Date: Tue, 12 Nov 2019 07:03:10 +0700
Message-ID: <CAD3AR6E486EAJ5EW_Wr4qiPeZU_M7TnDTC0g-CB+=6ob9Ru6mQ@mail.gmail.com>
To: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
	mchehab@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

On Tue, Nov 12, 2019 at 1:12 AM <madhuparnabhowmik04@gmail.com> wrote:
>
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
>
> This patch updates the list of RCU API in whatisRCU.rst.
>

Tested-by: Phong Tran <tranmanphong@gmail.com>

>
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> ---
>  Documentation/RCU/whatisRCU.rst | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
> index 2f6f6ebbc8b0..c7f147b8034f 100644
> --- a/Documentation/RCU/whatisRCU.rst
> +++ b/Documentation/RCU/whatisRCU.rst
> @@ -884,11 +884,14 @@ in docbook.  Here is the list, by category.
>  RCU list traversal::
>
>         list_entry_rcu
> +       list_entry_lockless
>         list_first_entry_rcu
>         list_next_rcu
>         list_for_each_entry_rcu
>         list_for_each_entry_continue_rcu
>         list_for_each_entry_from_rcu
> +       list_first_or_null_rcu
> +       list_next_or_null_rcu
>         hlist_first_rcu
>         hlist_next_rcu
>         hlist_pprev_rcu
> @@ -902,7 +905,7 @@ RCU list traversal::
>         hlist_bl_first_rcu
>         hlist_bl_for_each_entry_rcu
>
> -RCU pointer/list udate::
> +RCU pointer/list update::
>
>         rcu_assign_pointer
>         list_add_rcu
> @@ -912,10 +915,12 @@ RCU pointer/list udate::
>         hlist_add_behind_rcu
>         hlist_add_before_rcu
>         hlist_add_head_rcu
> +       hlist_add_tail_rcu
>         hlist_del_rcu
>         hlist_del_init_rcu
>         hlist_replace_rcu
> -       list_splice_init_rcu()
> +       list_splice_init_rcu
> +       list_splice_tail_init_rcu
>         hlist_nulls_del_init_rcu
>         hlist_nulls_del_rcu
>         hlist_nulls_add_head_rcu
> --
> 2.17.1
>
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
