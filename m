Return-Path: <SRS0=IZhi=GT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73919C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 16 Jan 2021 12:43:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB3AF23117
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 16 Jan 2021 12:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB3AF23117
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6FFA285725;
	Sat, 16 Jan 2021 12:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VbXya4Pw3UtO; Sat, 16 Jan 2021 12:43:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5489E85608;
	Sat, 16 Jan 2021 12:43:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40041C088B;
	Sat, 16 Jan 2021 12:43:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75230C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Jan 2021 12:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5FE3E85FB0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Jan 2021 12:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lING6g8JKfrH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Jan 2021 12:43:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BFCEA81889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Jan 2021 12:43:43 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id s26so17218029lfc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Jan 2021 04:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ih2bWbihIwTt5GR+VXSr8Jwt2/K7Zjnq6Bf7MbhjpL0=;
 b=evvT4dzzmhJjqWP/QCbAkaJpdk79tLyOfIjP/eguqoXbg9K9rJ5BDTukrS/WBd98MP
 VNiK9xtUqRIea+ZaqcIa4X2C/4BCxAKZ8dYztcpwW84wEyrf49u1AMjOBe3kAGfgElmP
 PCvhYqAQ3K1wc/sVIJMQUZBv5pTmiEh8KlIvhEx5DuDR090HxIS+r9qO353SN649oA4N
 8EY96yGvU98oWWmr/w90xF0pHXmK+ejP33bI7hcspWBEzuvpAAQzPxCADWYRZTjeREBI
 oc0xU5NjZbxoene3jOvykiflVzcaSCIZ44oohdiC7BLUs4irxhShxywSuoZEXdg3CmQO
 6h2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ih2bWbihIwTt5GR+VXSr8Jwt2/K7Zjnq6Bf7MbhjpL0=;
 b=Y5srqcrQ+Ve8thYzx9wwDkGNGs3EnY6V8JvKxKnjcHHZZo76bOtQ15GQno7sgnxAAq
 rv0GKNGOTCpgwTqLHuhC/EudKyAF3n4clp9uUrXqQmVpTKtnimCr+DuKpe+nYT/nwaU+
 Gphckl8K/xGLbafqPSQD9OJaDlezKncbWGALOP98whPWMwxFKlhewYam7UQ70iLOogIX
 8vkg3VVFw2O3oanr4l+/WxCfBPFaCMsagAUXwKDNBff1e7i/evVSaDU8wYywRsDij5ZV
 NsslFH4sPmswI+377+MDb8gAFa1tQ2hpI3SSzdREOvuqwDpBVdiTUcmKj/Xiye1oF+3p
 8QJA==
X-Gm-Message-State: AOAM533AXVZNpqiCiI49GuUOM3MR/aJbQ+nsntO7Mp+4KAmr2z+Dg1vQ
 JkBRs/gt5CL4fOmh6eWj/OBS768L40ScBx1eOxo=
X-Google-Smtp-Source: ABdhPJxHYLh8rJSzDoNnFoRppa2jUVnO0uAN9Tgq+NZZVGpoHTx/krjSfR9NiAGV5U7B/pJxsP0NXYjsNg7viIGstVY=
X-Received: by 2002:a19:4196:: with SMTP id o144mr8277527lfa.342.1610801021657; 
 Sat, 16 Jan 2021 04:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20210116122220.27261-1-yashsri421@gmail.com>
In-Reply-To: <20210116122220.27261-1-yashsri421@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 16 Jan 2021 18:13:32 +0530
Message-ID: <CABJPP5CxhBreFsM_YZvr3V4_jOdrRVkUX22E2bEwnL+Wf=nYJQ@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add warning for
 avoiding .L prefix symbols in assembly files
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

On Sat, Jan 16, 2021 at 5:52 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Local symbols prefixed with '.L' do not emit symbol table entries, as
> they have special meaning for the assembler.
>
> '.L' prefixed symbols can be used within a code region, but should be
> avoided for denoting a range of code via 'SYM_*_START/END' annotations.
>
> Add a new check to emit warning on finding the usage of '.L' symbols
> in '.S' files.
>
> Suggested-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/lkml/20210112210154.GI4646@sirena.org.uk/
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7030c4d6d126..87d96a039e64 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3590,6 +3590,12 @@ sub process {
>                         }
>                 }
>
> +# check for .L prefix local symbols in .S files
> +               if ($realfile =~ /\.S$/ && $line =~ /\.L\S+/) {
> +                       WARN("AVOID_L_PREFIX",
> +                            "Avoid using '.L' prefixed local symbol names for denoting a range of code via 'SYM_*_START/END' annotations; see Documentation/asm-annotations.rst\n" . $herecurr);
> +               }
> +
>  # check we are in a valid source file C or perl if not then ignore this hunk
>                 next if ($realfile !~ /\.(h|c|pl|dtsi|dts)$/);
>
> --
> 2.17.1

From an earlier conversation:
>   So basically, you can use an .L symbol *inside* a function or a code
>   segment, you just can't use the .L symbol to contain the code using a
>   SYM_*_START/END annotation pair.

So this check warns on all uses of the .L prefix
I think that might be incorrect.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
