Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD59185095
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Jul 2024 17:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720027413; cv=none; b=AZMEb5AFqRBV8n07Vgse5U/yFWFOdrevO4/pyRWblVeCpOIi8Ui/cxVtpFswZEC3vkfqc3qlmhZ2D7QBaMSoyMjB5H7bYE+kqUNBvj4xKMb1Pueitg24tZ7ox/jtmMZ2QdzJCc7t5bX1ivWzP8TGeh1doS5IK/wI+a7XWBKVKgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720027413; c=relaxed/simple;
	bh=9Qs5ol2ze5oiR2DbW9m/2gue58457PaRyAxDKiR93+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJr9RjHXnmPO7LvpvaxOLk2jZ79kIfHYTBkizK3ivKNMnwrmQoRF+weMG2LDw8+1cw/9Toaka43cGyWeSDEGD1Sb/OM/re+GZG7ZyqiAC0h43sCUSVGYK7BoBJiWZsQ8kIG6zJpbiKpbtK3Cv8Keg8IiYpJ3YmLE6YaurMl9rcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgWD7K2S; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgWD7K2S"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA04F40070
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Jul 2024 17:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ETMdzu6TbUcu for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Jul 2024 17:23:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=av2082000@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9A06841793
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A06841793
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bgWD7K2S
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9A06841793
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Jul 2024 17:23:29 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-63036fa87dbso6554407b3.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Jul 2024 10:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720027408; x=1720632208; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ti6v24oTe1MEKhNZLLn/dVPsQr2JQWNo5ls87iglapk=;
        b=bgWD7K2S1ZzJT1hVB/RRD5ueJ/o0/p1fStOaENTfnmkRO6k6VQkPxj0MypLn5PtefI
         nL9ZRE6a+sEmn3hj30gZzVllE8T+Q/ArMs4Qm1uK3o0FofrHcG2BCze13RgZpihCFz6C
         pOy6ohOOQAfnaLbOmnBklfzBOj8mztrs3w8KuMtFC4qFyf/cnYvrDjGnt2UIkDxvBWiL
         jbx+EpKvk53rIiN7Yx50O0ATD8ypRWkYn7PlOlauGZ9zS+7NCxcEmprmDx6tYgxT+01J
         UxBYIcSWuaQaVadxrl7hU5TZebtIsDVlnZf7tNNmEYddQguDIXpGILyhC+qXkHAh/fq6
         4xQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720027408; x=1720632208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ti6v24oTe1MEKhNZLLn/dVPsQr2JQWNo5ls87iglapk=;
        b=qFex+4OcUNf12Zq5EG85qLjiEdibzY6ieCpUVzC3wn+9Yh0yrdRQ+OdDoQhCoMyZff
         84OcFjVH5HfAYIeImYGkvmbuJVFyxzmfEtxDSl7u9L1EPW/rhOcJDtrQTLWPGKspNZl1
         zEKTQANOYSpt2z53oT1fRrr+RoFqP2yJDIFxvzdDClZnnkwa7mg3VhZGkJ1yX/P1fSuz
         ENhZ0GhHcaXelwc0jwR3QPX8tiDQx9Aa4TVP4kSnQdVM1n8j23te64kekyOWFay5HMrp
         68EykSKIW/I00q7GC+J3nGgNogRJGcPxCgtiap+caaR4cmOLYvm9ZmmwxBwcKtVdHiB6
         Kh8A==
X-Forwarded-Encrypted: i=1; AJvYcCVp7KfzkktZixMAHx25NhJQ/wBlg2zimrmnUfgurg5v4TwKjjGlUnwpWfA6cgde7MZF81uswvQjAUJWz2oeAHvNwcgxx/ifng+9bwu6gVtESLdUCDBFr92lFA8E5J+f
X-Gm-Message-State: AOJu0YyRUEQAl/0mPMbz8yqolqZg78r2TL/lScB9o8Vr7XVYYW3cAzC9
	j2Ozom2FYe1iSZrnfdS2hEo4LI4p8nZFxcsfKk6VjMCNicni2k5VxVmAE/fam9qgWrivos412NR
	e742R0QXm5Y5uMveb+qqWER4FRK8=
X-Google-Smtp-Source: AGHT+IFWOydMbN6BlWi7lFEJsFqVYPn/wQrhz+LemE/ooLfbb7YSNlm3inzv1ZHEE/FXcdtbKBxpbSiueYfE+CJjO98=
X-Received: by 2002:a0d:ebcb:0:b0:61a:e557:6ce1 with SMTP id
 00721157ae682-651800ecdddmr15155807b3.1.1720027408329; Wed, 03 Jul 2024
 10:23:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240616203231.43724-1-av2082000@gmail.com> <d6cd7441-53f2-4c88-a361-729e3abe81c1@marliere.net>
 <CAPMW_r+sPGF5=+=edLY81X+Cd4bMWKFJw3sDd0mzaZEM9b75BQ@mail.gmail.com> <f64523f0-db39-4e3a-85a6-1a3cb07e2d08@marliere.net>
In-Reply-To: <f64523f0-db39-4e3a-85a6-1a3cb07e2d08@marliere.net>
From: Amit Vadhavana <av2082000@gmail.com>
Date: Wed, 3 Jul 2024 22:53:17 +0530
Message-ID: <CAPMW_rKV1BkBbrhcKNkMvhSatoHRNk58O8m8m8GHCN1Jb2V-8Q@mail.gmail.com>
Subject: Re: [PATCH v2] slimbus: Fix struct and documentation alignment in stream.c
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org, 
	linux-kernel@vger.kernel.org, rbmarliere@gmail.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Jun 2024 at 18:00, Ricardo B. Marliere <ricardo@marliere.net> wrote:
>
> Hi Amit,
>
> On 19 Jun 24 23:28, Amit Vadhavana wrote:
> > Hi Ricardo,
> >
> > I have rebuilt it again, and there are no any warnings or errors.
>
> Thanks for checking, FWIW:
>
> Reviewed-by: Ricardo B. Marliere <ricardo@marliere.net>
>
> BTW, I received this message plus another two empty ones. Please check
> your settings. Also, make sure not to top-post [1].
>
> Best regards,
> -       Ricardo.
>
>
> [1] https://en.wikipedia.org/wiki/Posting_style#Top-posting
>
>
>
> >
> > Thanks
> > Amit v

Hi Srinivas,

I hope you are well. I am following up on a patch I submitted on 19
Jun regarding a kernel document and Ricardo reviewed the patch.
I understand you have a busy schedule, but if you could find some time
to review the patch, I would greatly appreciate it.
Your feedback would be invaluable in helping to improve the quality of
this contribution.
If there are any changes needed or additional steps I should take,
please let me know.

Thanks
Amit V
