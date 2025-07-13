Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C581AC44D
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 13 Jul 2025 07:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752391467; cv=none; b=ND9LXIWBWeY9BsvmQ8pMvvP8xeN47d0F7QAe0Neul6zjV+Z5+A8VzwroSi8lQPGaUYmn+BHFBqYTgobWijyfxIJdB9Aiv0a+Y9jb96QfsKUynYDhYxwY5nXXoLcMAW2WA68EdblVdq7ovOljT3NTWz3Jn1hIdZbA5qUBkiLm0/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752391467; c=relaxed/simple;
	bh=NF4T7x0KqxjN1Zk8N6FsAYLGGhLudo88bi0zLj313w8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgnfVcKg+fZ+pnIxQJpHn7ML2IgMz8UFxVhX66X+wCU+2maaZ535d1m7Lrq4t9al029AuTEzzVYuEhCCGch51vdr1d0vnBdzxEniv+bDExk6p9RuXNbIwmb7L64peisVZn8IKZYHaFh7NI2ZYXPLdxgN4XsXsqVcNaRcSPEzbOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3MfWQ0l; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3MfWQ0l"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-613b02e801aso1824415eaf.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 13 Jul 2025 00:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752391465; x=1752996265; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NF4T7x0KqxjN1Zk8N6FsAYLGGhLudo88bi0zLj313w8=;
        b=S3MfWQ0liR/wSBbK2JXE2c3DhfhTyLkz3ea5zPPYDoj5Lf8/dOfeC0Y7Fxtu4hIpWf
         LC7P5ODNaucOLtwZor2ZufDPxre+tkPKY+wUzT6hEMj2riEH04Ce4R5ZOaWoTFNyl+92
         2JYfHflzLGfd7XAfO+BOiIFLK+JqOOxdKq6J11xrXWqszguJxEMdGziw1l/dkfvzaZsl
         12NGZ+5Bm7QKiYCLM/RBpZ7btETkrtMcDGNMYWj1HhSIaEXrJJUKnExuMY5YFntP6L//
         HEitakHfhzo88RwLamMTF2BVS9FsaV4NDw7JP+EbZc3+V4/o0xCWXxtQDls8hSw7s/Ec
         NuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752391465; x=1752996265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NF4T7x0KqxjN1Zk8N6FsAYLGGhLudo88bi0zLj313w8=;
        b=OYTBSXnt11LO0IB+mOHIEz+39uQMQ8JfM4i6816JhvQQIKUKBC1UhH527CQ8PxQHcN
         /fE/FSVKcoKdcQVfO0AQ1ze9S5RdH1BQdhmML1DeSJ/yHstn45MfKW+x5MmaTogScI+j
         d2sR8wgbfW+atALu/Cua4eaTJFiyqkg5/pQb44y0eY2yU2s+jTmzLkx+USbIdx1qTD1a
         NVs6i5BP0A/t3xJ9ImiTkl8pXzchfwuA8KrenNvzrEbm9FM4FymrVTwuiW3TLj+Oj4+H
         DPGOKOogSB8XdyxFcvnM6YhJHs/RJPtrG0++YvBt4+CjH2m63zBFPwydT965mhz/hjhn
         4PSA==
X-Forwarded-Encrypted: i=1; AJvYcCVukaXYsajTMFztlX74SMSUyyDSnr/7GTmW8gF7YhaY+KGqKr4Uvl2nhS4d0jytSFnm+QBJzITl9MDAXyazcyd2DonTMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyN+5jKKtTfOI+PB0l57+7RLz0MMIhtf6suu9NrarXZkGZHlwf8
	6QsKnBRZR010yddi8o/vR0gWsscHXWvnIzRb2VWe/2vTzEt6osq9GsRclyA3hv7XUJhC4BwazNK
	pSJr6oAa2Ky2aQhThQKtA4m/rDMBT86c=
X-Gm-Gg: ASbGncv9OrK1j66TRYmRZytwFzdHJ9h2yjRlsoszjKZXCCBR+wt1DV8YQzryqZr+FSf
	8c1U4pzFLJbaUQFU7wnig/4m1GrAa+ogaqfpp2FRki3+R3wb4NtQ+QurpeRF65jxI/J2i63n6Zy
	wP7ZyHoMb2WLZek3HQShwmLZKD1yw2diuUSG8kNdvsdnV93SaiV5hW1BLXFhCR4cLoCzWdeiW3V
	oOvOJR+
X-Google-Smtp-Source: AGHT+IF4MVlkH5px2xPEDZFHk6dNlX+XsNGMYba1X0b8T0K3Xbl3WyMNlX6CvaCyE1A4AgmNNGss1OBgEQJEirl7H3w=
X-Received: by 2002:a05:6870:348:b0:2e4:68ee:4f21 with SMTP id
 586e51a60fabf-2ff2691ae25mr6065869fac.20.1752391464913; Sun, 13 Jul 2025
 00:24:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250605175634.16362-1-suchitkarunakaran@gmail.com> <4448980c-d385-45ea-b8c2-b4a0bdde39c9@oracle.com>
In-Reply-To: <4448980c-d385-45ea-b8c2-b4a0bdde39c9@oracle.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Sun, 13 Jul 2025 12:54:13 +0530
X-Gm-Features: Ac12FXztDpOAEQp2PK_JpoFMZDvk2yr5zsd19V5JVpNovPmjyPli4RSP681BYt8
Message-ID: <CAO9wTFimpNU+h4XvpRSS5ocKWzVF4G3W8G2NyOMt09VtVdgKSg@mail.gmail.com>
Subject: Re: [PATCH RESEND] jfs: jfs_xtree: replace XT_GETPAGE macro with xt_getpage()
To: Dave Kleikamp <dave.kleikamp@oracle.com>
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 12 Jul 2025 at 01:40, Dave Kleikamp <dave.kleikamp@oracle.com> wrote:
>
> On 6/5/25 12:56PM, Suchit Karunakaran wrote:
> > Replace legacy XT_GETPAGE macro with an inline function that returns a
> > xtpage_t pointer and update all instances of XT_GETPAGE in jfs_xtree.c
>
> I'm picking this up, but I simplified it a bit. I dropped the size and
> rc arguments. size is always passed in as PSIZE and I have the function
> return ERR_PTR(-EIO) on error.
>

Hi Dave. Thanks for picking this up. Is there anything that I need to
do from my end?
