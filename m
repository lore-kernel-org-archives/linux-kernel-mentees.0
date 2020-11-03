Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FDBC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 10:46:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ED92223BD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 10:46:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qyibEy77"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ED92223BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3CE708701C;
	Tue,  3 Nov 2020 10:46:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XsBghvc9jpGX; Tue,  3 Nov 2020 10:46:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CD38785D57;
	Tue,  3 Nov 2020 10:46:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4C55C0889;
	Tue,  3 Nov 2020 10:46:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66525C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 10:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4EACE2038A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 10:46:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BOufcmMWjb-b
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 10:46:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 38E242002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 10:46:07 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id z2so15646573ilh.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 02:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ag5HbYrSqPPaRVROpCssKCNNk9mYf6Z62iEuBjPLYXc=;
 b=qyibEy77aQadmp639hmeFu7PKcT6MOYBjptIpRufgJlNdTmRQc5NyGgXYbZ4dF7zlg
 Ha7gSuFWnWP49hj9GJ5rbfpkyj8xAMI1O0ZVMrXtzPbIsdirsuTLU0NvA1Izqxklc2xV
 38IkDi2pn4K/g6AlkLjRslUmo841b0wcdrdbGplkI3ciihTKWfct57rSLJrckhEj2U2P
 uncg46ro/fqUkeshpgjWIwQv0aFPGUVFgqBt+RaqZgy9I77kJed5J4oZT/wXmwEQIx/j
 PXJhlKYAhLSBvJ4QbKLdnRkWbuS4//Qq+4nCKnfhaD5PzurpFuquZDPalj/8qGUmNEK9
 qlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ag5HbYrSqPPaRVROpCssKCNNk9mYf6Z62iEuBjPLYXc=;
 b=dOBGse7D1rELnRxRjVMG9f69L4Ui4+XIp+LNscSD0Px9XmVuK2ueFqwh/xcUK47pGx
 9Y3+71LE3PB20wbA5OV8h0neNDaCUVYxc5poUYOJj3GW4BICmp0OD6NIhapBU/Sjd0EP
 T30Rldfz02poxPEKk6y6d/so0L38OT24eEoJJLezIzq8KbYhwIlFIwd2VdRUOBhqxwon
 53XHNp+8q0tju8DGyqNms+sHQUs0b9axBXfMljDMLqN3Cb9ZAPeqMyfDCITfW3Q9o3gi
 58GdFVdyKHfnbU59urpN1pUxqvRuxhOmQrkQbOHnLoAHrSZnw7hxwI/bjLbcjRklV7tv
 y61g==
X-Gm-Message-State: AOAM531SOIMMgAy8yJF8DYoTAEdKvP2yhTJOt+b4Ez6ON+gNgcsRm3/V
 SfQuq2m8UqkKmHtVYAcEm6x7HEQRg6jBjWOxs4Lq8FzqoKw=
X-Google-Smtp-Source: ABdhPJzvI0l7uJ3HqTKP1sR94ZTMwGpdHHFwTSx2BOTLkyNsDasaFp7g0T3fb71cfnHRrHVKtJzYCa3kkhdSynMx7Bs=
X-Received: by 2002:a92:cb51:: with SMTP id f17mr13381386ilq.64.1604400366543; 
 Tue, 03 Nov 2020 02:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20201031132556.10379-1-yashsri421@gmail.com>
 <alpine.DEB.2.21.2011020808040.11801@felia>
 <0c7aec7d-3ec6-882f-062f-3b7683f8b594@gmail.com>
 <1a4d2f16-fd08-197b-3e6c-b433e84ebcba@gmail.com>
In-Reply-To: <1a4d2f16-fd08-197b-3e6c-b433e84ebcba@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 3 Nov 2020 11:45:52 +0100
Message-ID: <CAKXUXMyFXF_Ny3NjDpnXAQsfcS8h-kAUnaoS3gzcY0hWRb69aA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	COMMIT_LOG_LONG_LINE
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

On Tue, Nov 3, 2020 at 9:38 AM Aditya <yashsri421@gmail.com> wrote:
>
> > On 2/11/20 12:55 pm, Lukas Bulwahn wrote:
> >>
> >> Or to prioritize another issue and possiblity for fix rules.
> >>
> >> You can see that there are potentially some good options for fixes around
> >> the tags and sign-offs Dwaipayan has investigated.
> >>
>
> Sir, I am working on BAD_SIGN_OFF, which occurs in multiple variants,
> for eg.
> 1) WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to
> attribute nominal patch author '"Zhang, Jun" <jun.zhang@intel.com>'
>
> 2) WARNING:BAD_SIGN_OFF: email address '"Matthew Wilcox (Oracle)"
> <willy@infradead.org>' might be better as 'Matthew Wilcox (Oracle)
> <willy@infradead.org>'
>
> 3) WARNING:BAD_SIGN_OFF: Duplicate signature
> etc.
>
> Should I answer all these variants in one patch?
>

Also, please open an email with a new subject when the subject of the
discussion changes.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
