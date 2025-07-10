Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11ED18BC3D
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 10 Jul 2025 23:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752191753; cv=none; b=cocPVVjHFKRkZwPOEbSKCqXhhOXJcZLSHrUkDLQpxkKNFYbkj5iE0rOPSBTXdt7x2uKN4HK5YRvDJZJc2YyW+7iTY0AC+6NhyHWg0NTrdhDSjnWiCDRgcR5xqei3/Qnw8umw45L4dzb7d+3/ljOtPZERbCGSpnjNhzwXkLV0WGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752191753; c=relaxed/simple;
	bh=XAiCmdF7RkApsrZzspm68HM57eB+JOIvtiEXT38QR50=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=bOA6HGc1z1wuBTEhTUNVLafVmMdxI+E2TA8TmNlA57rhnj7a3t6tSGy/HvHwLeJc8nCCRBFtDJZPCBVSQwcF6l3TERiec/R9F1xT+k7SfmpZyt0Zy1r+Mi7oo0x25fXpZXdaTXv1zBIkCJsV/1NYpddu7CHzpLiahr/+ec8UBjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=AJiYnw55; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="AJiYnw55"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23508d30142so17475135ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 10 Jul 2025 16:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752191750; x=1752796550; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAiCmdF7RkApsrZzspm68HM57eB+JOIvtiEXT38QR50=;
        b=AJiYnw55QflHXB7pF6E8R6C0pLLrRtVlehsbHqFiCVEHir80jIXAM0cd3ffZAAU8Ta
         ho1p3skw4zcyOSUwCZktfexNnjd5SkuSNbpAISTANJxtkg6Aq7oWHfZ4M3blXm+sppbC
         Bc6La1APXbnTRDuz0JuF6QcQEQNP60/1gqQdHpoXfwoAtoQudkY1HGUddp2IjL2W2Atw
         X6umew0DYFctqngf7jlKIn48ozxI5JhYspj+YhyMFU+8BBBJ0ddpPrCr8jl/i39FIWaI
         ln/zxc45Cjf55p2LFnvAC6nb130/HYYT4jb/e2Lb0vqVqdexsB8PSI10ubVV4CsTTRjV
         fzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752191750; x=1752796550;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XAiCmdF7RkApsrZzspm68HM57eB+JOIvtiEXT38QR50=;
        b=lEllM7sqqXZxmu2Y32bvKTlgbwbakrMvxlPBStg04DN3OdKCxNhugxpOHQAXyqPxq6
         OJUXJ9+gudKtGwqXVvBlYY950k7/rnLlqoHLwrl5Bc12frUdFdqBQnNwm6QC5JCtXfnF
         nnC5dXYmaSw1VH6alKHOy8fFktT4lpaBnBzyHMxjXMpOpaHBSYjoRv7oqp7BPJH+iz3f
         eCdlGkvZmKlqRPboBH9oDgpTFK0xMBIP4MENVj/5uujJroXO3K5aLor0zkMp90fz/tCt
         G1jNfPXoxQ6SLqfJ7q55V7Oune53O3YEiyRjN4VbnDH4fgCfAGLw3v499tsrtQ/O33Xh
         Yi0w==
X-Forwarded-Encrypted: i=1; AJvYcCVEUYGduvtecNoVX0I7LgV04hJQN1QcnKIgANuEwenot+GhzqTfIJw6ONswNLn8/Ists5gOegJFPqcvdK3sBQAybul8eg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyewL4ahPO2F5svaZ6st8JpAPTRUU5I2QXZPlQaLJBjoJkFYCNp
	33a8DyJjjYsgia9o/ZlHiWRPSy4UqZjr8uwVqLATZM54V7Q5gGVIrMkoo9rcBKP13p4=
X-Gm-Gg: ASbGncsFZJuvgwn4OjZFCVh7/Un3Gc4bUb3Ju+pUIFMwE8FKg4I+vbMr8m4API49NiS
	B/krP3bgFk1csJ0yuMzpXM27WzP4kiLLs0Lg71w9JRi+H9S1Ag3g+NExB5RI/tgUD1GtIZBRGRS
	jIBf+NL7nf2Ab/LdeRXW6DDNkOmk5zNMmaSM/DUwynFyQDyxh26PJiTOUqtKpnLw+Tr67YYPgtD
	TFZnmUaOe+NgFAOTiP4eL/DqqSrsDs/0XPaDjqfO5TMgKPfNca423RK77r9WopiTXuK91EE+CVh
	rVeTWbaQUZuXDwrYN3en6m4j7wvVnxV4REXnrNi/frcDbnYivsGw3MKLsAlJBj60ZybqsRWuA5Y
	nff3zlnJojxP/YJZySo4=
X-Google-Smtp-Source: AGHT+IGFOD84u48rdMoEXoU5fk8FMmvZ6/jUey0yaBE6/wbev3/1XX3T9b4F6Rm6Kh49JQ9zptu2AQ==
X-Received: by 2002:a17:903:3df1:b0:235:be0:db53 with SMTP id d9443c01a7336-23dede98446mr11872605ad.51.1752191750126;
        Thu, 10 Jul 2025 16:55:50 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4365b10sm31581145ad.240.2025.07.10.16.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 16:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Jul 2025 17:55:47 -0600
Message-Id: <DB8S4WLTG1SS.NVODTL6KNFXF@brighamcampbell.com>
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "David Hunter" <david.hunter.linux@gmail.com>,
 =?utf-8?q?Hanne-Lotta_M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>,
 <mchehab@kernel.org>
Cc: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4] media: Documentation: Improve grammar in DVB API
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250708155206.91281-1-hannelotta@gmail.com>
 <680b91c0-0fae-4230-9fa1-da988cb82e65@gmail.com>
In-Reply-To: <680b91c0-0fae-4230-9fa1-da988cb82e65@gmail.com>

On Wed Jul 9, 2025 at 10:22 PM MDT, David Hunter wrote:
> On 7/8/25 11:52, Hanne-Lotta M=C3=A4enp=C3=A4=C3=A4 wrote:
>> Fix typos and punctuation and improve grammar in documentation.
>>=20
>> Signed-off-by: Hanne-Lotta M=C3=A4enp=C3=A4=C3=A4 <hannelotta@gmail.com>
>
> Overall, good work. Here is a suggestion for future patch series:
>
> Subsequent versions of patch series should be posted as replies in the sa=
me thread. Currently, each version is its own independent thread, which mak=
es it hard to track changes. This link has the documentation for the proper=
 way to handle subsequent patches:
>
> https://www.kernel.org/pub/software/scm/git/docs/SubmittingPatches.html
>
> The relevant part starts at "To that end, send them as replies to either.=
.."

This documentation you've linked is specific to git, not the linux
kernel.

The kernel documentation argues against doing what you suggest [1]: "for
a multi-patch series, it is generally best to avoid using In-Reply-To:
to link to older versions of the series. This way multiple versions of
the patch don=E2=80=99t become an unmanageable forest of references in emai=
l
clients."

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html

>
> Another good practice is to have the previous versions' links from "lore.=
kernel.org" directly in the change log.=20
>
> Thanks,=20
> David Hunter

Nice work, as usual, Hanne-Lotta.

Brigham

