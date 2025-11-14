Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF90335094
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 16:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763138254; cv=none; b=VDo957ifr8+AOQjSrw0QRNdbps95TZp2C4xVPJK5hRmATPEboNLHOs/wf08xF9HVnVS826gpEvEJK7d2zQKLiGTnkXz7sRLoMtqjxW1ddDSxx3Gl0C4mzblIXcQAeR8X+V5e6dXnMMK8gEFMQln/ovDwHC215mS+eyKEbNXfG0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763138254; c=relaxed/simple;
	bh=6s2EBzXGw0jlDZLIBeNdlnVqiBzH4+2CCRLHKhxPbw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmEw9YR+oyAsz6yb1bLvGwsgxsG+SgAhrIwoSakNrHl8knm/uQiMyQsMdqzLmzThD6UNQGqptb7kbjJMzt/5UUi4tTFSkMl3lIkLrKsUAoBmaG90S90BcJleDQvz1eYnbFBboTPlmSSXx4WhrOy3i+zO9uRX3gdEyYpMtZZ07/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddHdSPWz; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddHdSPWz"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA88A40344
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 16:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZXiTx33DmkU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Nov 2025 16:37:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E29F402E8
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E29F402E8
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ddHdSPWz
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4E29F402E8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 16:37:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F398441F1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 16:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B362C19421
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 16:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763138250;
	bh=6s2EBzXGw0jlDZLIBeNdlnVqiBzH4+2CCRLHKhxPbw0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ddHdSPWzT9iLA0CIazG5hZBsxK9JOrw6KpqrhfKbLWf6P3vrIuQISR8zxSXFEpCS7
	 qcjtRBsoFsKUIfUt6ZATiyIuA2a2z8ckveUKqmGbfEA2tNQz6Lq6aN6iGrVePEKbpK
	 luPdnC/7lmi5HcyG3Eb3TUiIGzaTYzv8X+SHcS/5Oa5dXIhGRzmUVWVY8fRplmpSl3
	 GX/0J3/IfYn1f+MoOnMbcP2U3PMrZZbwZqlV+u5G8PFUz+w2qYyI5WUWQd21OIcuuC
	 ljilKGV3e0Tby6+of3+bvvGA+Iq7p307rKHauVcrz6gUUMQINdXUBB3OOUQfvRrgOK
	 fswZWrmM9aJgg==
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-45076d89e56so1055680b6e.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 08:37:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUH3jtaonam5voj4+Fqp2Vt3GHBiJ95H+dqDqaG0tnL5hPU0hqCxOgZi/B2pTFWkPFIpjRZr+pgA1x2/1bPtpU+tb+tjA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzdZ2LqtRpXOdtjjhJ2ApaVfLYGZyXtRz7kHm6hacJ1wQf2oaIB
	D5UsJZjpwu0iRrrl493QbjkklW5iFp6KtF6HF8U54yo5NAPCv9gfbRWjS1prj9KP/XyAey2AZ5I
	PvTndTIwnnDuhlpp4BQMbonSTciTlMcw=
X-Google-Smtp-Source: AGHT+IG3r+hhrmR59PqBPg4MuCIUY2ildFPsk+Mm5FK3UoAduJPupdv5Zl5o+KnlE+edDBYIN2vqDjw6oecNbkUS1xE=
X-Received: by 2002:a05:6808:5285:b0:450:730e:d109 with SMTP id
 5614622812f47-450975f39f2mr1810272b6e.48.1763138249423; Fri, 14 Nov 2025
 08:37:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251113110914.44223-1-adelodunolaoluwa.ref@yahoo.com> <20251113110914.44223-1-adelodunolaoluwa@yahoo.com>
In-Reply-To: <20251113110914.44223-1-adelodunolaoluwa@yahoo.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 14 Nov 2025 17:37:17 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jEqNPPNE-5FuAm3Hd8YH1BecoOACoa6Sdr+VjHwBk9PA@mail.gmail.com>
X-Gm-Features: AWmQ_bk6uIL6nGxanLp1nz7r_AfPkJf8ZXDEXbMSrvMK5cOgQsm4X881SePbEKo
Message-ID: <CAJZ5v0jEqNPPNE-5FuAm3Hd8YH1BecoOACoa6Sdr+VjHwBk9PA@mail.gmail.com>
Subject: Re: [PATCH v2] power: swap: Convert kernel-doc comments to regular
 block comments
To: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Cc: rafael@kernel.org, pavel@kernel.org, lenb@kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 12:31=E2=80=AFPM Sunday Adelodun
<adelodunolaoluwa@yahoo.com> wrote:
>
> Several static functions in kernel/power/swap.c were using the kernel-doc
> comment style (/** ... */) even though they are not exported or reference=
d
> in generated documentation. This triggers documentation warnings and make=
s
> the comments inconsistent with kernel style for local functions.
>
> Convert these comment blocks to regular C-style comments (/* ... */) and
> update a few function headers to include proper "Return:" descriptions
> where applicable.
>
> No functional changes.
>
> Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
> ---
> changelog:
>
> changes from v1 to v2:
> - Converted function comment blocks from /** */ to /* */ style for
>   static functions
> - Minor reformatting of comment indentation and spacing
>
> v1 patch link:
> https://lore.kernel.org/all/20251106113938.34693-2-adelodunolaoluwa@yahoo=
.com/
>
>  kernel/power/swap.c | 54 ++++++++++++++++++++-------------------------
>  1 file changed, 24 insertions(+), 30 deletions(-)
>
> diff --git a/kernel/power/swap.c b/kernel/power/swap.c
> index 0beff7eeaaba..076ed590e8c9 100644
> --- a/kernel/power/swap.c
> +++ b/kernel/power/swap.c
> @@ -336,10 +336,8 @@ static int mark_swapfiles(struct swap_map_handle *ha=
ndle, unsigned int flags)
>   */
>  unsigned int swsusp_header_flags;
>
> -/**
> - *     swsusp_swap_check - check if the resume device is a swap device
> - *     and get its index (if so)
> - *
> +/*
> + *     check if the resume device is a swap device and get its index (if=
 so).
>   *     This is called before saving image
>   */

I'd move this comment (after the change above) into the function body
(before the first statement) because the function does more than what
is says.

>  static int swsusp_swap_check(void)
> @@ -362,11 +360,8 @@ static int swsusp_swap_check(void)
>         return 0;
>  }
>
> -/**
> - *     write_page - Write one page to given swap location.
> - *     @buf:           Address we're writing.
> - *     @offset:        Offset of the swap page we're writing to.
> - *     @hb:            bio completion batch
> +/*
> + *     Write one page to given swap location.
>   */

There is not much value in the comment after the change, please drop
it altogether.

>  static int write_page(void *buf, sector_t offset, struct hib_bio_batch *=
hb)
> @@ -526,8 +521,8 @@ static int swap_writer_finish(struct swap_map_handle =
*handle,
>  #define CMP_MIN_RD_PAGES       1024
>  #define CMP_MAX_RD_PAGES       8192
>
> -/**
> - *     save_image - save the suspend image data
> +/*
> + *     save the suspend image data
>   */

Same here.

>  static int save_image(struct swap_map_handle *handle,
> @@ -671,11 +666,8 @@ static int compress_threadfn(void *data)
>         return 0;
>  }
>
> -/**
> - * save_compressed_image - Save the suspend image data after compression=
.
> - * @handle: Swap map handle to use for saving the image.
> - * @snapshot: Image to read data from.
> - * @nr_to_write: Number of pages to save.
> +/*
> + * Save the suspend image data after compression.
>   */

Same here.

>  static int save_compressed_image(struct swap_map_handle *handle,
>                                  struct snapshot_handle *snapshot,
> @@ -904,11 +896,8 @@ static int save_compressed_image(struct swap_map_han=
dle *handle,
>         return ret;
>  }
>
> -/**
> - *     enough_swap - Make sure we have enough swap to save the image.
> - *
> - *     Returns TRUE or FALSE after checking the total amount of swap
> - *     space available from the resume partition.
> +/*
> + *     Make sure we have enough swap to save the image.
>   */

Same here.

>  static int enough_swap(unsigned int nr_pages)
> @@ -930,6 +919,8 @@ static int enough_swap(unsigned int nr_pages)
>   *     them synced (in case something goes wrong) but we DO not want to =
mark
>   *     filesystem clean: it is not. (And it does not matter, if we resum=
e
>   *     correctly, we'll mark system clean, anyway.)
> + *
> + *     Return: 0 on success, negative error code on failure.
>   */
>

Please remove the empty line between the comment and the function definitio=
n.

>  int swsusp_write(unsigned int flags)
> @@ -1077,10 +1068,8 @@ static int swap_reader_finish(struct swap_map_hand=
le *handle)
>         return 0;
>  }
>
> -/**
> - *     load_image - load the image using the swap map handle
> - *     @handle and the snapshot handle @snapshot
> - *     (assume there are @nr_pages pages to load)
> +/*
> + *     load the image using the swap map handle
>   */
>
>  static int load_image(struct swap_map_handle *handle,
> @@ -1190,11 +1179,8 @@ static int decompress_threadfn(void *data)
>         return 0;
>  }
>
> -/**
> - * load_compressed_image - Load compressed image data and decompress it.
> - * @handle: Swap map handle to use for loading data.
> - * @snapshot: Image to copy uncompressed data into.
> - * @nr_to_read: Number of pages to load.
> +/*
> + * Load compressed image data and decompress it.
>   */

This comment is not too useful any more, please drop it.

>  static int load_compressed_image(struct swap_map_handle *handle,
>                                  struct snapshot_handle *snapshot,
> @@ -1529,6 +1515,8 @@ static int load_compressed_image(struct swap_map_ha=
ndle *handle,
>   *     swsusp_read - read the hibernation image.
>   *     @flags_p: flags passed by the "frozen" kernel in the image header=
 should
>   *               be written into this memory location
> + *
> + *     Return: 0 on success, negative error code on failure.
>   */
>

Please remove the empty line between the comment and the function definitio=
n.

>  int swsusp_read(unsigned int *flags_p)
> @@ -1567,6 +1555,10 @@ static void *swsusp_holder;
>  /**
>   * swsusp_check - Open the resume device and check for the swsusp signat=
ure.
>   * @exclusive: Open the resume device exclusively.
> + *
> + * Return:
> + *     0 if a valid hibernation image is found,
> + *     negative error code on failure.

I think that the above can be one line, can't it?

>   */

Please remove the empty line between the comment and the function definitio=
n.

>  int swsusp_check(bool exclusive)
> @@ -1631,6 +1623,8 @@ void swsusp_close(void)
>
>  /**
>   *      swsusp_unmark - Unmark swsusp signature in the resume device
> + *
> + *      Return: 0 on success, negative error code on failure.
>   */

Same here.

>  #ifdef CONFIG_SUSPEND
> --

Thanks!
