Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F78759169
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRE2/WVq"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7100610DB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 16:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7100610DB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PRE2/WVq
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HB63hFMrsJCh
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 21 Nov 2023 16:05:34 +0000 (UTC)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 11206610D7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 16:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11206610D7
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so4379078a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 08:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700582733; x=1701187533; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmJ5foKdCDZg8tIi4TPGeihCrXCC5qbN8sSmRpGmvoM=;
        b=PRE2/WVqObRW5mZI04RYV9CypyN30kMWHySx1SYiFJpT6nORF+fBxLOT8vUM7AJ6pL
         MGt57WHbrhQoEmgGApc4C3ADacFouUs52UPGc1DCyucaAeVbGFIxHP7HUiw3th4HNHah
         1GIhmN7og5MpfsR/Cj50DKcXo6ra4/s0bQ/+9P9YizR8jCBagN8MhJgAle4pGr7np/vD
         NBQn4ITLG0J53+OXyKNqPSzOjMjbIr3rt9PoEJ+8VFEM9YQIdjKIhC4r1dc4vVa3FDeJ
         JxJFNv/mvic5qAAeTlmrAaXKeG+gNaiM7U/XsiGH8OHkKwO04wjwtpT+dVbJnRDVUBqT
         wMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582733; x=1701187533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmJ5foKdCDZg8tIi4TPGeihCrXCC5qbN8sSmRpGmvoM=;
        b=RR7/pLQppc0evwRcipHe7cNu/8ILgapYgvFq6Vkvk/nepdJc3b4Mlt9M5YTcAPqZn/
         edT+5Rn/VbdJgsUDaV1q2JdwML8BbJtXEnWC70lJDYxKmx/zF4MCBuxrBcm/5W2qNiXE
         jp9vlu76u5p79krw9qUmulvAA5NdytkQP3BDqo869BA84ZI6MHG11l3M3yYgPND6vVsQ
         p3FJ2N0e5SzTCOmFGPKHu0cgjtEKPne+6iQmm1Vo/2ZbOv1KOk1E6e9A4Al2WF3pHVlT
         s9G7G2XmeShAtrpmdgbsxvt+whp0bFuPTt7BOSfLgflRMXzi9d3fq/QLSdGBiLFKf1ea
         dctQ==
X-Gm-Message-State: AOJu0Yyy4Njn8Cvmb7botYAd3+BTjYFrinPXDp1LrWWWpAO3zAGkyTzD
	v+PGZ+msvoIygLqK5Nwx8wbLCcgbVfZHq8h0+ag=
X-Google-Smtp-Source: AGHT+IGuQALslBqctoJ8yEzlNidGXCIbHB7HvO1+wbKEsxysx7DJQ6t93Ms9KX1AS83Umdf9IaOlzK+sSVY6I7jeYEY=
X-Received: by 2002:a17:90b:38c1:b0:27d:d9c2:6ee5 with SMTP id
 nn1-20020a17090b38c100b0027dd9c26ee5mr12266549pjb.9.1700582733189; Tue, 21
 Nov 2023 08:05:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311212204.c9c64d29-oliver.sang@intel.com> <VI1P193MB07520067C14EFDFECCC0B4C399BBA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P193MB07520067C14EFDFECCC0B4C399BBA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 21 Nov 2023 17:05:22 +0100
Message-ID: <CA+fCnZfTJwfmO-OYcUst0fsWhRa+MzDtkv1N_bMob9_1BivdJA@mail.gmail.com>
Subject: Re: [PATCH] kasan: Improve free meta storage in Generic KASAN
To: Juntong Deng <juntong.deng@outlook.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, ryabinin.a.a@gmail.com, 
	glider@google.com, vincenzo.frascino@arm.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 5:03=E2=80=AFPM Juntong Deng <juntong.deng@outlook.=
com> wrote:
>
> This bug is caused by the fact that after improving the free meta
> storage, kasan_metadata_size() continues to calculate the metadata
> size according to the previous storage method.
>
> I will fix this in a separate patch.

Hi,

Please send a v2 with the fix folded in instead.

Thanks!
