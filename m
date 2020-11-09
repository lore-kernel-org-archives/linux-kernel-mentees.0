Return-Path: <SRS0=nBzY=EP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A645DC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 08:31:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F217C206ED
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 08:31:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARfyWBXZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F217C206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 50A3886990;
	Mon,  9 Nov 2020 08:31:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ImUR-P-Py6f; Mon,  9 Nov 2020 08:31:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3C0B58696A;
	Mon,  9 Nov 2020 08:31:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24CB3C088B;
	Mon,  9 Nov 2020 08:31:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26A0FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 08:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1123520505
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 08:31:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M96jnzrFNPY7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 08:31:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 54FC8203E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 08:31:02 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id u19so8945212ion.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Nov 2020 00:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gCmRHba3p0PV9XzKnLBBBEmjgbuhh4zzgdktdZSYXF4=;
 b=ARfyWBXZTCYtJkllRxvcKgHEamw/KweYa6I9FgHWtjJhbr5E0yNUwuT00oC/fKfORc
 b5KWb3GmgE9DX/yRxFGoIvmvpXoUnXlWG5fmJk0O42+d07utBuj74lAJlN6OT1Z1IXeP
 nQH1Lrhar0UWTD0SQW/3q6X9omSTgHNoeTk+eW8QuBO19wRFipg96jB+rAkhSwHlatZe
 X/7YQfkog4SJ2ti/bZ48lo1nbUUv2c6/2mAk3B5M9wjPpmCoH8WjihtPE7MIPjdN7oiv
 pDU01CK8ssFqEDEj+167EYwhosMV0Zh1oZ1hIa0MDnH3+LfTljRplCRZ8TgucRVB1x48
 zAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gCmRHba3p0PV9XzKnLBBBEmjgbuhh4zzgdktdZSYXF4=;
 b=gX4j2SrpracYJYPug4dm3nakC5Z2cZNGiSKA90MhnqOcFgu/fgUK6jEYn77zb3Dmzy
 j2ItPHCgiFLbcSoTgc3z7xzx/h4KH++Kr4jbOSOrveLhVZ/4tOjIFqGPDss1dPQvXUCf
 2IVnDoQ4IOP3jia/msJ5z84WIxO5202UYo0nLkUtYC7W0TuM/d3+lZANZi7stJ98kF7b
 UhoEW9ixSi6fqkE8E7j7U7usnx3eZmR6sexcfyV8tbjT3GOphZYrHbKAFI/PnW/S6tpR
 SnQc9yk2wC3INRf9GK49VTXt7CskFo92G4O+RMcNvCOu001SGL3qrk8BILqsQdxO3kQE
 HvqA==
X-Gm-Message-State: AOAM5319lCU445dcJ2K1jdoMmT2d+/EU10ciRzOjgPJ0D8noG7gIqbyL
 nYc4PIrg8pw8Jfs3Njp/5Wmm3qJlA3i/2MBarWE=
X-Google-Smtp-Source: ABdhPJxvmjI4aOx8kk9ULBH3wX9gB1AlRZWfkiTkmcaxiwkxOuQch3kzOqxQ6N5ytQkztJ5ltW0RjrOvXte7XwGwCmM=
X-Received: by 2002:a02:ba90:: with SMTP id g16mr10004861jao.96.1604910661575; 
 Mon, 09 Nov 2020 00:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20201103133052.21053-1-yashsri421@gmail.com>
 <CAKXUXMx9nYkFBy3RYf-LY9VYUeWcf4FuQpT9F3=_p=9baBQikA@mail.gmail.com>
 <9d2a5a04-fd6e-f805-2036-2ab68358fbf4@gmail.com>
 <CAKXUXMyigTJoFAbwp=dE-4QEpOyUkMT=87UMJ3HZub35azb_4g@mail.gmail.com>
 <7c83fa07-8882-8261-cf35-3bd3347faccb@gmail.com>
 <alpine.DEB.2.21.2011040756210.21917@felia>
 <3b0a4c22-300a-819b-877e-e002dcebd831@gmail.com>
 <38c1c666-9ba0-a833-c76d-b00c172582c1@gmail.com>
In-Reply-To: <38c1c666-9ba0-a833-c76d-b00c172582c1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 9 Nov 2020 09:30:50 +0100
Message-ID: <CAKXUXMwo3j3p+3mM+vS-T5Gq602QdhV-5d_OHq90_LXE07NhyQ@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fixes for
	BAD_SIGN_OFF
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

On Wed, Nov 4, 2020 at 10:29 AM Aditya <yashsri421@gmail.com> wrote:
>
> On 4/11/20 1:17 pm, Aditya wrote:
> > On 4/11/20 12:27 pm, Lukas Bulwahn wrote:
> >>
> >>
> >> On Tue, 3 Nov 2020, Aditya wrote:
> >>
> >>> On 3/11/20 9:04 pm, Lukas Bulwahn wrote:
> >>>> On Tue, Nov 3, 2020 at 3:47 PM Aditya <yashsri421@gmail.com> wrote:
> >>>>>
> >>>>> On 3/11/20 7:09 pm, Lukas Bulwahn wrote:
> >>>>>> On Tue, Nov 3, 2020 at 2:31 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
> >>>>>>>
> >>>>>>> Currently, checkpatch warns if the author signs-off two or more times
> >>>>>>> for the same role.
> >>>>>>> E.g., for commit 6dd47d9754ff ("mac80211: fix
> >>>>>>> ieee80211_txq_setup_flows() failure path") we get warning:
> >>>>>>>
> >>>>>>> WARNING: Duplicate signature
> >>>>>>> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> >>>>>>>
> >>>>>>> Here there are two Signed-off-by lines present for the same user. So,
> >>>>>>> we get a warning to remove one.
> >>>>>>>
> >>>>>>> Similarly, we get warning if the author of the commit signs-off under
> >>>>>>> co-developed-by.
> >>>>>>> E.g. for commit 6e88559470f5 ("Documentation: Add section about
> >>>>>>> CPU vulnerabilities for Spectre") we get:
> >>>>>>>
> >>>>>>> WARNING: Co-developed-by: should not be used to attribute nominal
> >>>>>>> patch author 'Tim Chen <tim.c.chen@linux.intel.com>'
> >>>>>>> Co-developed-by: Tim Chen <tim.c.chen@linux.intel.com>
> >>>>>>>
> >>>>>>> Provide fixes by removing the duplicate signature line and the
> >>>>>>> co-developed-by line from the commit
> >>>>>>>
> >>>>>>
> >>>>>>
> >>>>>> The duplicate signature fix is simply wrong, because the indication of
> >>>>>> the duplicate signature is imprecise.
> >>>>>>
> >>>>>> Probably, we would first really need to understand the valid cases of
> >>>>>> duplicate signature warnings compared to the invalid ones.
> >>>>>>
> >>>>>> Please rework.
> >>>>>>
> >>>>>>
> >>>>>> Lukas
> >>>>>>
> >>>>>
> >>>>> Oh, Alright. I get it now.
> >>>>> I ran a script over WARNING: Duplicate signature.
> >>>>> I found out that it is occurring with these prefixes and their
> >>>>> frequencies:
> >>>>>
> >>>>> Acked-by -- 6
> >>>>> Signed-off-by -- 218
> >>>>> Tested-by -- 3
> >>>>> Reported-by -- 1
> >>>>> Reviewed-by -- 8
> >>>>> Cc -- 28
> >>>>>
> >>>>> IMO largely Signed-off-by warnings in this frequency might be false
> >>>>> positives. This is so because we are simply checking for duplicate
> >>>>> occurrences in the sign-offs in checkpatch.pl
> >>>>>
> >>>>>> Probably, we would first really need to understand the valid cases
> >>>>>> of duplicate signature warnings compared to the invalid ones.
> >>>>>>
> >>>>>
> >>>>> Is there any way I can know that the second sign-off is intended?
> >>>>>
> >>>>> In my observation, this particular commit was prefixed by '^Link:.*$'
> >>>>> Alternatively, we could use maintainers list to ensure that the signer
> >>>>> is maintainer and avoid this warning.
> >>>>>
> >>>>
> >>>> That is somehow difficult to say, but probably it is best to
> >>>> deactivate this multiple Signed-off-by: warning on git commits.
> >>>>
> >>>> On patches it makes sense to warn about duplicate Signed-off-by: ; on
> >>>> commits, not so much.
> >>>>
> >>>>> How about other prefixes. Can we remove them?
> >>>>>
> >>>>
> >>>> Can you show the duplicate Tested-by, Acked-by, Reported-by,
> >>>> Reviewed-by, Cc in some structured format to quickly check those?
> >>>>
> >>>> Probably for those, we can really assess them to be all true positives
> >>>> (maybe we can find out the reasons as well) and hence a fix for them
> >>>> would make sense.
> >>>>
> >>>
> >>> I generated git logs of all such commits, which might help us get some
> >>> idea about mailing list or sign offs as well.
> >>>
> >>> Acked-by:
> >>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task5/acked_by.txt
> >>>
> >>> Reported-by:
> >>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task5/reported_by.txt
> >>>
> >>> Reviewed by:
> >>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task5/reviewed_by.txt
> >>>
> >>> Tested-by:
> >>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task5/tested_by.txt
> >>>
> >>> Cc: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task5/cc.txt
> >>>
> >>>
> >>>>> I observed one of the 'Tested-by' warnings and it was because of these
> >>>>> sign offs:
> >>>>>
> >>>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >>>>> Tested-by:Liang Yang <liang.yang@amlogic.com>
> >>>>> Acked-by: Liang Yang <liang.yang@amlogic.com>
> >>>>> Tested-by:Liang Yang <liang.yang@amlogic.com>
> >>>>> Acked-by: Liang Yang <liang.yang@amlogic.com>
> >>>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >>>>>
> >>>>> Here tested-by is occurring 2 times.
> >>>>>
> >>>>
> >>>> That example seems to be a clear true positive. It would be
> >>>> interesting to see how that happened to be added twice in a commit.
> >>>> What was the state on the mailing list and what did the maintainer do
> >>>> to add these tags twice (was this done manually or is there some
> >>>> automatic tool involved?).
> >>>>
> >>>
> >>> I found the mailing list state corresponding to that day. It indeed
> >>> seems like a true positive.
> >>>
> >>> Link1:
> >>> https://lore.kernel.org/linux-mtd/CAFBinCB9Z_H4wX3_g2hVL-XnS6Oq-KtPHa4Z1ws79FGp5jCapQ@mail.gmail.com/
> >>>
> >>> Link2 (reply):
> >>> https://lore.kernel.org/linux-mtd/8ff232c3-f325-5b91-4de1-a39e63939df2@amlogic.com/
> >>>
> >>
> >> Yes, and it suggest to fix patchwork :)
> >>
> >> How are your python programming skills?
> >>
> >> Do you want to try fixing patchwork for this issue?
> >>
> >> Lukas
> >>
> >
> > Sure, I'd like to try. Please guide me for it.
> >
>
> I might have got it wrong. Did you mean fixing the patch we are
> working on currently?
> I must be intermediate with Python, not too expert though(like 3.5/5)
>

No, I meant the program patchwork; read the thread and learn how the
problem was picked up in this patch.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
