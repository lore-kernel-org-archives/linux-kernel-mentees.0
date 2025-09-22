Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503B22FC01B
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Sep 2025 11:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758540893; cv=none; b=T1Vjq+ky8eyCdEF2Q0ApHfobLWVBwKnG4lVaEF9U87e89wPfS+v0BrbCZcMtUOURFStHuAx7yrYFaNFC9BHX3ef6tbnWvIY6pSf/jTti/jhPHHgP5od3m1WQp3LgvlMxAcnK/UR0PTfg9hCU8Z4xvE+9pmEQ9vk6Df5BpjN/ou0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758540893; c=relaxed/simple;
	bh=Npwp37fasUaztNGjwbjQ24nWh04CyauLI9SVRQGWYVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aalbIyLM2KqjKJvTEgWDyik12gYoh7sngmTfDyl1X3kNMrIWbIHiEzWxwBvkKX+RqVnaqQvYXvbts5ejO+19n4kUtGU30KjA0Bx6hAPd7s3J6zUICLsXq1mepg8DfrmT7SmAFj9ay5JLaTdyf9xriYpOvaznLkUWKlxqnvRD3fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F3/4td9e; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F3/4td9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758540890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qBL6ran7eeZrT38sfsNjW8tntjx1L4Y7ebN1yvWq/ak=;
	b=F3/4td9e16Hb/It5f5yJUHmowuA/0pYj2B5EhkMd9YShUCtPiU4z8oM9NG6QGja+CVi8kP
	yD9E2wM3QbNvK07hnkiEAgm/sSZrEe1fk52Baa2erJDI97yh6YD4WhKVXvlAxTVQHwMcVt
	u8frCz9qrCbUuKctGq92ihJL6vefS1s=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-X0sySvC5NYy6Xf9l-AT3PQ-1; Mon, 22 Sep 2025 07:34:48 -0400
X-MC-Unique: X0sySvC5NYy6Xf9l-AT3PQ-1
X-Mimecast-MFC-AGG-ID: X0sySvC5NYy6Xf9l-AT3PQ_1758540888
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-272b7bdf41fso19086465ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Sep 2025 04:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758540888; x=1759145688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBL6ran7eeZrT38sfsNjW8tntjx1L4Y7ebN1yvWq/ak=;
        b=FZosiL/Be55xC/XIaxAWvyUvwXpVBHPKF6nO1Y6TaQxoO55VMMfB2mINShNGs/+sEB
         MlxdQkjjbuZYypmUDCBqsYxUoSdBJTZSSUXZg5EolxFRarnbSc5osC7vU8kiN4ggxfH+
         Srv8+b/nc+i+YpQ9A714xottuTcIUzL4ruYODZs+7eP1+Eri8+TByCLgLvB6GSyYZunH
         PxTwQ6mmWsYLu0C4rfEK916Nb7b99QKelERmpeDFlQefNVQCFJ7lefP6Yk8ABlaglKgt
         PCU0GVj20vt+vNQ73DW1tjYe7KbnnZuwlGu2kcTeW9A5PznwYVncFwfkhkkdlPsmTTKT
         8dKA==
X-Forwarded-Encrypted: i=1; AJvYcCWlI7+/amLDku/m9qzxzL6RRqo6tsOBHOmivBPJO+TzepmfSwYlMcbaTfVOqkqxBAQIURuovX/6fCwG+wKvP89zBAFvXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCpWW7ONGguZ89Z5FQftdrVHpqBDlAZRFZAOZ+190G+yEEgU71
	fyzkRW0/OU8ChoyqVxia6g9Hko94BOSsUJHmvZshABNGWrppVqOOxO7fsMJKmWkVJYqzljIEeS2
	Y0L7Nkzwt+MMfwWE/ekbAXM0/yygEAjkCFHIB9spycJsEOe4bLcX4etEImwyWc5O9I3RHpBZGRt
	XvzFVqPoX8k19ZYIjb5ZiMe3HFt3GRKAKI6k62Kg2CfVAJy68v1rA=
X-Gm-Gg: ASbGncsKiyvDWj3ui1wfz4snGIZHpNzgzUVRo6qZDGKdXIVpjr1y1V6yU0yWtOwTbal
	ulCx5Kz6PCiiLfll860rxasu1wlbV5MYWBZlEWRxsaq5wvRDGkye7e2/PxrXmOQZn2CU/pwqkPE
	k0vNTsyV8J6MyT39Quxqw=
X-Received: by 2002:a17:902:ea05:b0:269:874c:4e48 with SMTP id d9443c01a7336-269ba550cd2mr171325265ad.47.1758540887720;
        Mon, 22 Sep 2025 04:34:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwLwdzoDbuGVYQuEXIHCwQRTwpdPRrzzjp4kgxXc6oHg0FWMGDElJOvb0KAxMjWimeR5uUisUdrOaN5DAr/3I=
X-Received: by 2002:a17:902:ea05:b0:269:874c:4e48 with SMTP id
 d9443c01a7336-269ba550cd2mr171324975ad.47.1758540887355; Mon, 22 Sep 2025
 04:34:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918204830.229918-1-kriish.sharma2006@gmail.com>
In-Reply-To: <20250918204830.229918-1-kriish.sharma2006@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 22 Sep 2025 13:34:36 +0200
X-Gm-Features: AS18NWACBZeRywvdMekJd6TCUmlssvkKRWZotY-3FIzanJ_u6GG0-GRTwtWtIGg
Message-ID: <CAHc6FU4CVLe6ZxPR1Q3dc=5i1ARrNAjnB_NEK5_Y_Pecmk_4bQ@mail.gmail.com>
Subject: Re: [PATCH] gfs2: add bounds check for rd_length in compute_bitstructs()
To: Kriish Sharma <kriish.sharma2006@gmail.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-kernel-mentees@lists.linux.dev, 
	syzbot+7567dc5c8aa8f68bde74@syzkaller.appspotmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kO8v5AiM4bnphNHWT7g2k8BMKC9VAWkwiA50CDfa-zw_1758540888
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kriish,

On Thu, Sep 18, 2025 at 10:49=E2=80=AFPM Kriish Sharma
<kriish.sharma2006@gmail.com> wrote:
> compute_bitstructs() allocates an array of gfs2_bitmap structures
> using kcalloc(). The function only checked for length =3D=3D 0 but did no=
t
> guard against excessively large length values.
>
> If rd_length is too large, the multiplication inside
> kcalloc(length, sizeof(struct gfs2_bitmap), GFP_NOFS) can exceed
> KMALLOC_MAX_SIZE. This leads to the allocator calculating an order
> greater than MAX_ORDER when calling get_order(), which is invalid.
> As a result, __alloc_pages() warns about the bad request.
>
> This patch adds an explicit check that rd_length is not only non-zero
> but also within the maximum safe limit for kmalloc_array():
>     length <=3D KMALLOC_MAX_SIZE / sizeof(struct gfs2_bitmap)
>
> This ensures that get_order() is only ever called with a valid size,
> resulting in an allocation order within MAX_ORDER
>
> Fixes: b9158815de52 ("Merge tag 'char-misc-6.9-rc7' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/gregkh/char-misc")
> Reported-by: syzbot+7567dc5c8aa8f68bde74@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D7567dc5c8aa8f68bde74
>
> Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
> ---
>  fs/gfs2/rgrp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
> index 26d6c1eea559..a879e8030568 100644
> --- a/fs/gfs2/rgrp.c
> +++ b/fs/gfs2/rgrp.c
> @@ -760,7 +760,7 @@ static int compute_bitstructs(struct gfs2_rgrpd *rgd)
>         u32 bytes_left, bytes;
>         int x;
>
> -       if (!length)
> +       if (!length || length > KMALLOC_MAX_SIZE / sizeof(struct gfs2_bit=
map))
>                 return -EINVAL;
>
>         rgd->rd_bits =3D kcalloc(length, sizeof(struct gfs2_bitmap), GFP_=
NOFS);
> --
> 2.34.1
>

this patch looks correct at a certain level of abstraction, but a
better approach would be to sanity check the resource group fields in
read_rindex_entry(). Andy and I are trying to work out a patch that
does that.

Thanks,
Andreas

