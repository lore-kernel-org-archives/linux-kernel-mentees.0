Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B478084DE9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 06:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720679967; cv=none; b=mJ1RnhGRrgTwh+qwtejvE/Z92s+k69B4ig7KOYwk2cWFRIpleWneWCt34Hd8fr1TvHWDfk1EXKT9KhE56HJ3qoclt+BwVwxh9W2A+I5BX+t1I8WgQXp3eS9SmaZ3ThkG8F1w5YTLHz62KmGm0PQ6GOxDRVpdSPjg2rj9pGH5Pps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720679967; c=relaxed/simple;
	bh=YYuzY+tLhiCKB0JfC01of+ILfufjHR1RA3FDo//2JiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJWll9ulDtItwwJJCYHJJog6uhXUS8KZ3KIvjwyT2UJmmD7KfDzt4Em5R6KG1NaPrUmyXkSO83Tn7UbHw60CLTl3KSzE1Zo+gC6HiWWO7EEEHJk0jwQdcTM0s/cMcBuFDlTMKydeDfshnskf7TUxNbFYKJUSU4NpeQ7spP8C+Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czn1ovPu; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czn1ovPu"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4593B8115F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 06:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaxwGpjRn8u5 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jul 2024 06:39:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=fdmanana@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F2D95810E3
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2D95810E3
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=czn1ovPu
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F2D95810E3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 06:39:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 50CC0CE180B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 06:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD4DC4AF0C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 06:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720679958;
	bh=YYuzY+tLhiCKB0JfC01of+ILfufjHR1RA3FDo//2JiY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=czn1ovPuwZRPwkEMEGJNLqZvmdEJkCTC8Q03rhl6F5FW2JhUQHz63FjvRcr0ezkOr
	 bqISEZUFVnEVqmqnzxptnWxsXZyHc9JWJwMwnC+H12l41zNckcvZ5kDjCacyL8ovPs
	 s0E4oDvTj/5aRzMR2WwGI/DTrWNTh8tpeLvPUXEG7REvEZv6hyX27xhDhSz1kFoTmt
	 exJ1UpnnHMgR25/a+abQ4AOiijAjOmldne29PLalhniHo0rLQLtlzvlqyeOXhF+s7f
	 Srg9BVyAUxsaXdcfzeVDnE0age9uTF1q2tfzRl/5MlOoBy8Gvs7ql+kT1hK4tTDlOJ
	 1htJA36xFjXAw==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a77e2f51496so77643366b.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Jul 2024 23:39:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMD9oK2eR7GRiG7awf3feD9CZs6VKOApYzrs6hfC50yhN8IuyHak2il1qxJKWcXgZuu1defqqkkm6ylBSxgjlT73C6pwHKNOG3zqY994cd5VdbIGz9IVQigQNX/SOz
X-Gm-Message-State: AOJu0YzXuw/ErIq9PBfoj7g3otos2mzrJjJ657b1kWbegrNWX2I/zlQY
	L3w/9umfTSB/p9ECWZc5UF2ckiHrFxQaO4uwWihl2ovr/51V+JLth6IDmVvNk/eWYejmLFhHIvW
	1+Ts2ZEGB3JXYCIWtCgsgiEJ5hoM=
X-Google-Smtp-Source: AGHT+IEdES9ra8lhHWoM6RznNhYmve7qzUYd0yRVQr+T7mh+ANEEX2mvwgKpXCmmQQzLCaxjyKbu0vIgnqH3wKUV+64=
X-Received: by 2002:a17:907:da7:b0:a77:eb34:3b4b with SMTP id
 a640c23a62f3a-a780b68a989mr646569166b.11.1720679957126; Wed, 10 Jul 2024
 23:39:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240710-bug11-v2-1-e7bc61f32e5d@gmail.com>
In-Reply-To: <20240710-bug11-v2-1-e7bc61f32e5d@gmail.com>
From: Filipe Manana <fdmanana@kernel.org>
Date: Thu, 11 Jul 2024 07:38:40 +0100
X-Gmail-Original-Message-ID: <CAL3q7H6NisGBRqccRv3CiTDMJS0M7ZnvSrEDDHSOUn2TaWBBDw@mail.gmail.com>
Message-ID: <CAL3q7H6NisGBRqccRv3CiTDMJS0M7ZnvSrEDDHSOUn2TaWBBDw@mail.gmail.com>
Subject: Re: [PATCH v2] btrfs: Fix slab-use-after-free Read in add_ra_bio_pages
To: Pei Li <peili.dev@gmail.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	Qu Wenruo <wqu@suse.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, skhan@linuxfoundation.org, 
	syzkaller-bugs@googlegroups.com, 
	linux-kernel-mentees@lists.linuxfoundation.org, 
	syzbot+853d80cba98ce1157ae6@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 5:29=E2=80=AFAM Pei Li <peili.dev@gmail.com> wrote:
>
> We are accessing the start and len field in em after it is free'd.
>
> This patch moves the line accessing the free'd values in em before
> they were free'd so we won't access free'd memory.
>
> Reported-by: syzbot+853d80cba98ce1157ae6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D853d80cba98ce1157ae6
> Signed-off-by: Pei Li <peili.dev@gmail.com>
> ---
> Syzbot reported the following error:
> BUG: KASAN: slab-use-after-free in add_ra_bio_pages.constprop.0.isra.0+0x=
f03/0xfb0 fs/btrfs/compression.c:529
>
> This is because we are reading the values from em right after freeing it
> before through free_extent_map(em).
>
> This patch moves the line accessing the free'd values in em before
> they were free'd so we won't access free'd memory.
>
> Fixes: 6a4049102055 ("btrfs: subpage: make add_ra_bio_pages() compatible"=
)

This type of useful information should be in the changelog, not after the -=
--

And btw, this was already fixed last week and it's in for-next:

https://github.com/btrfs/linux/commit/aaa2c8b3f54e7b4f31616fd03bb302cc17ccc=
f39
https://lore.kernel.org/linux-btrfs/20240704171031.GX21023@twin.jikos.cz/T/=
#m9a92a5d980230323ec351a24adf9a3738cfbbc40

Thanks.

> ---
> Changes in v2:
> - Adapt Qu's suggestion to move the read-after-free line before freeing
> - Cc stable kernel
> - Link to v1: https://lore.kernel.org/r/20240710-bug11-v1-1-aa02297fbbc9@=
gmail.com
> ---
>  fs/btrfs/compression.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
> index 6441e47d8a5e..f271df10ef1c 100644
> --- a/fs/btrfs/compression.c
> +++ b/fs/btrfs/compression.c
> @@ -514,6 +514,8 @@ static noinline int add_ra_bio_pages(struct inode *in=
ode,
>                         put_page(page);
>                         break;
>                 }
> +               add_size =3D min(em->start + em->len, page_end + 1) - cur=
;
> +
>                 free_extent_map(em);
>
>                 if (page->index =3D=3D end_index) {
> @@ -526,7 +528,6 @@ static noinline int add_ra_bio_pages(struct inode *in=
ode,
>                         }
>                 }
>
> -               add_size =3D min(em->start + em->len, page_end + 1) - cur=
;
>                 ret =3D bio_add_page(orig_bio, page, add_size, offset_in_=
page(cur));
>                 if (ret !=3D add_size) {
>                         unlock_extent(tree, cur, page_end, NULL);
>
> ---
> base-commit: 563a50672d8a86ec4b114a4a2f44d6e7ff855f5b
> change-id: 20240710-bug11-a8ac18afb724
>
> Best regards,
> --
> Pei Li <peili.dev@gmail.com>
>
>
