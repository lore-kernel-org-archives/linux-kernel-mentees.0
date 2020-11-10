Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A00C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 20:19:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0FDA20780
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 20:19:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBi/bEKQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0FDA20780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA922861F1;
	Tue, 10 Nov 2020 20:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jY6hC1aD-YXB; Tue, 10 Nov 2020 20:19:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3D87F86148;
	Tue, 10 Nov 2020 20:19:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A8C1C0889;
	Tue, 10 Nov 2020 20:19:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41D0AC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 20:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3D20485381
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 20:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jeA0Bie1vBeT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 20:19:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DFF9385CA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 20:19:07 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id p12so1672695ljc.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 12:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E+HGg1tjdVCPOLBF3EpGzG3a21euQl+VNCG8zCMo1ag=;
 b=QBi/bEKQqeF9O3uok0QwU674gAA/HINMV2qfSAZMlSr7RZgWL4Py6E9GE0xl8DI42M
 gfT+ry/VeEkBKNJ5GHhp5ghEM5PkT7JEHTHDQJrUYDMhJsuLUfNNuwvftaIAXxsMSzXU
 rnulHKwNRiSq/fogoL1goQUzijACdgOlow5CVgMbiuHSyNmJc+UYAdq/+S5yzQls3wsV
 e9com/oa3yLogeiXix/mPHFthgmxCfv8AaTLgLwS+fUXW04jojbFnsoqMSdhu9S+X6kJ
 gMSvxjIvADAn/sLa+Tj3h8T8W/vp2FZful4xk/3n0mQEuh44xpaZSRvK5cBvSDfj/NE5
 hT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E+HGg1tjdVCPOLBF3EpGzG3a21euQl+VNCG8zCMo1ag=;
 b=CmtctN62oMt2sxfdQPhAbPwsLym/GrHIwV7b/M4WIHhoFC4SKpHyu6pvLxVJkQ8BSt
 foDpdsjAtP6TT9uHi/gOT264ykcqcsGuY+x1bA/Rwt3oxHnCG6IsPe1eCLFnbxRsPLBi
 Ht2gqFC53KzfEnAPvK5dsJFktqSxtv8z4Rvzsdk0pLOUPwkVIac9+yQ1eeD8b7oKt8Lq
 f9Pia6nxKvH4qIZ3pUFN3pSygVwITxkrZVy9FYwvZGRLUDLsX4fXgNPiYFTS1LmZVqgP
 qMEwMVOJC6B1CwUijK+yCs8+taEF+A9ER26dU5DcT90exceQbU9WVXKA5mqcLKsFYhbv
 5deQ==
X-Gm-Message-State: AOAM530UkxfawF4lgnObvCAfJa+Pll/JGDaaUijm1GocQWWJnXF9jzUW
 oH5ffVwh9IbMSbB4RloKHVxWnO8qUZcxy8J2X08=
X-Google-Smtp-Source: ABdhPJx8rlKOZjmRiDjeAYkozr+KjXZPG61jNnFvJqDzNnf6LyVFvHVox1G5ldVWB9cpPzH1w/RZRMgrAWFIjJcR4fI=
X-Received: by 2002:a05:651c:cb:: with SMTP id
 11mr9465094ljr.159.1605039545129; 
 Tue, 10 Nov 2020 12:19:05 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5DjToH6UXKuKoyCk_vKZux1cBoD4yRpGsWBXM9iZS2fKw@mail.gmail.com>
 <CAKXUXMxN=_NjyfEsX4ufAyLGX23u7VRG5UCSEbLco5ALZGwh0g@mail.gmail.com>
In-Reply-To: <CAKXUXMxN=_NjyfEsX4ufAyLGX23u7VRG5UCSEbLco5ALZGwh0g@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 11 Nov 2020 01:48:33 +0530
Message-ID: <CABJPP5DCMHeZWG81deU-ooN9F1XEKO-p7yYA6SQ_yP1wX8vXRQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] git_commit_id false positives
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

Hi again,

>> First of all there are 45 warnings of type:
>> References: 2248a28384fe ("drm/i915/gen8+: Add RC6 CTX corruption WA")
>> References: 860afa086841 ("drm/i915/gt: Flush gen7 even harder"), etc.
>>
>> Should references be simply exempt from this check? I don't
>> know much about it. But seems checkpatch is incorrect here.
>
>
> I understand what the authors intend to do. They want to refer to a commit as a tag, such as Link: for URLs or Fixes: for commits that fixed another commit. However, this format of using References: is not an agreed and common convention.
>
> We could ask on the mailing list if there is some preference for such a common agreement. Then, we can extend the kernel process documentation and add a rule for checking this convention in checkpatch.
>
> Do you want to do that? Expect some heavy discussion and some bikeshedding.
>

That certainly sounds intimidating to me. But I would like to give it
a go if possible. Whom do I mail for that? The documentation mailing
list or somewhere else?

>> And finally the other fixable warning is for those with split commit
>> titles itself.
>
>
> Yes, you saw that another mentee started this work but could not really finish that (yet?), right?
>
> This sounds like a good case.

Sure then I will work on a fix for this.

>>
>> Other than that, there was also this particular case with non escaped
>> quotes within the commit title.
>> Like:
>> commit 97a32539b956 ("proc: convert everything to "struct proc_ops"")
>> Should this be handled as well. Or is this a human error? I am not quite
>> sure.
>
>
> Of course, a commit title can contain quotes itself, but checkpatch does not handle that case properly; this case can be quite tricky to handle. Let us fix the other cases first and then see with an evaluation how often this remaining case really happens.
>
Okay I will do that.

> Another case of another non-standard commit reference is that when I refer to a commit with a broken title that still contains "[PATCH] xyz: do something" in the git history, I simply refer to it only with commit abcdabcdabcd ("xyz: do something") and I drop the [PATCH] prefix.
>
> That is a non-standard way but I think it should be accepted as standard or at least acceptable to checkpatch. Again, that also needs some discussion with more kernel developers.

I didn't know about this one. But I will try to get an
estimate on it and probably a fix.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
