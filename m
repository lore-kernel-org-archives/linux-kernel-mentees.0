Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8021FF1B4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Nov 2025 19:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763407188; cv=none; b=RsjmL3oCTf9DD4+0laZD0TEPOj2SBkZIsw2c8+oXPYiiemMzbMoHnmx7oBrWkEgADFyGoOnRTNMN1to+ujkBic8byQAs7hlfxJeepoVVMm/KOrdGcBRZMzFPPDPofMu9WB2XXa481Hl81rYyBLwHDZ8tFhZQeqSjV7wSxYdHOBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763407188; c=relaxed/simple;
	bh=7IweLGXm+rxNj/dgYu//lzoxM11mrNcsIB0DmhR3J2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QnviSuuqThMRy7OKBtQ9Bq6nWqYvTMLVY3rJfkpDy7lashCbb8oYJJUYq6rRp57OVAdPxTADix6V2Mcjd/dEJ7Fs2rZCyBcTuQ9ikv8jDjrzwnToQuJxnsQQKgOuhy2S8oCcDQB1IwrKX0e1AY6jeYrHDHwKVByT8jBMH9TE8W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsLf63yd; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsLf63yd"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C628660EB6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Nov 2025 19:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CJv6gBdL0NF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Nov 2025 19:19:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 98D4360E53
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98D4360E53
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dsLf63yd
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 98D4360E53
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Nov 2025 19:19:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 313D2605CB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Nov 2025 19:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9586FC19422
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Nov 2025 19:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763407170;
	bh=7IweLGXm+rxNj/dgYu//lzoxM11mrNcsIB0DmhR3J2Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dsLf63ydh/KRNd60bgN/tnWDwjFgPZ6UdI19pbtK4HTIj9KFr0LQa/7nhJtkScFCn
	 Sszqnyqp6sqFoBhjMUBcTB3MxcwF6cDj2CV6TqQLzBUdnSyBjn+cnN8t/8hOd67A0N
	 LD6sWqkHLPua9/jT3134MviteXQxYtUyqivWc+DUCdCBvUGAOavOYs5tqO68e0C9ea
	 wJ1QwoO96QAEnxoWibX0IuPvUAdZy9sKRYbg2V0cJjzB05bcU+zDs81gPhRps/gvTC
	 6R289A6eXJTrdxxzzPjjsNgBhMWgd3LY0YnFVyX9WXta2tPDjQgzQ8Dvt19Sd7YnLE
	 JKmoaNgolj7CA==
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6574d7e451dso826468eaf.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Nov 2025 11:19:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXYHPgmHbLsDLZs+HiAuAWff6FlRqUa/dwjJbxO2iv7ZAF7gHwF3ShBZoUL3oheyqJ+6ajPPAhROWLL5P0W79MnT/dOlg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yyyze79zab7JSWK53xEM9I61jcyJWdHwtZUI6+ZTxuK4MR/Dh4h
	uPZyHdP0HY+YdwD0ZzYTkKZrhNxJCRHW99BHmb+QppThkxliUN1oeahuq6kniTBffb7sw8cUhn+
	vD3GsB8Ajk5qjFpOzO4wdk+GHSg7KaBM=
X-Google-Smtp-Source: AGHT+IGeG8YbCy9ReyK/Xe+BypnWjlJnobg4T1MRtpAM3CukNpifMBeHIDhKyfFMEWGJx7MZe+SZUof/3eTguR1eqN4=
X-Received: by 2002:a05:6820:2015:b0:656:8360:3906 with SMTP id
 006d021491bc7-65733d3952amr5950251eaf.8.1763407168528; Mon, 17 Nov 2025
 11:19:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251114220438.52448-1-adelodunolaoluwa.ref@yahoo.com> <20251114220438.52448-1-adelodunolaoluwa@yahoo.com>
In-Reply-To: <20251114220438.52448-1-adelodunolaoluwa@yahoo.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 17 Nov 2025 20:19:17 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gy9Ms9bPWQD+Q=K5x=3zxu3UFnaRwP_s+C+p-wQAssyw@mail.gmail.com>
X-Gm-Features: AWmQ_blN0tjkImS2c7OPKT6FehKAIIafIBJp1hIhH0KCKLPTKiDnd0ppJEzchXc
Message-ID: <CAJZ5v0gy9Ms9bPWQD+Q=K5x=3zxu3UFnaRwP_s+C+p-wQAssyw@mail.gmail.com>
Subject: Re: [PATCH v3] power: swap: Fix comment style and clean up outdated
 function headers
To: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 11:04=E2=80=AFPM Sunday Adelodun
<adelodunolaoluwa@yahoo.com> wrote:
>
> Several static functions in kernel/power/swap.c were written using the
> kernel-doc comment style (/** ... */) even though they are not exported
> or referenced by generated documentation. This led to kernel-doc warnings
> and stylistic inconsistencies.
>
> Convert these unnecessary kernel-doc blocks to regular C comments,
> remove comment blocks that are no longer useful, relocate comments to
> more appropriate positions where needed, and fix a few "Return:"
> descriptions that were either missing or incorrectly formatted.
>
> No functional changes.
>
> Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
> ---
> changelog:
>
> Changes from v2:
> - Moved the swsusp_swap_check() comment inside the function as requested.
> - Dropped comment blocks that no longer provided meaningful value.
> - Removed unnecessary blank lines before function definitions.
> - Reformatted multi-line Return: descriptions into a single line where ap=
propriate.
> - Kept only useful non-kernel-doc comments consistent with style guidelin=
es.
>
> Changes from v1:
> - Converted /** */ kernel-doc style blocks to /* */ regular comments.
> - Cleaned up indentation and spacing.
>
> link to v2:
> https://lore.kernel.org/all/20251113110914.44223-1-adelodunolaoluwa@yahoo=
.com/
>
>  kernel/power/swap.c | 58 ++++++++++-----------------------------------
>  1 file changed, 12 insertions(+), 46 deletions(-)
>
> diff --git a/kernel/power/swap.c b/kernel/power/swap.c
> index 0beff7eeaaba..cf5736aabb39 100644
> --- a/kernel/power/swap.c
> +++ b/kernel/power/swap.c
> @@ -336,16 +336,14 @@ static int mark_swapfiles(struct swap_map_handle *h=
andle, unsigned int flags)
>   */
>  unsigned int swsusp_header_flags;
>
> -/**
> - *     swsusp_swap_check - check if the resume device is a swap device
> - *     and get its index (if so)
> - *
> - *     This is called before saving image
> - */
>  static int swsusp_swap_check(void)
>  {
>         int res;
>
> +       /*
> +        * check if the resume device is a swap device and get its index =
(if so).
> +        * This is called before saving image
> +        */
>         if (swsusp_resume_device)
>                 res =3D swap_type_of(swsusp_resume_device, swsusp_resume_=
block);
>         else
> @@ -362,13 +360,6 @@ static int swsusp_swap_check(void)
>         return 0;
>  }
>
> -/**
> - *     write_page - Write one page to given swap location.
> - *     @buf:           Address we're writing.
> - *     @offset:        Offset of the swap page we're writing to.
> - *     @hb:            bio completion batch
> - */
> -
>  static int write_page(void *buf, sector_t offset, struct hib_bio_batch *=
hb)
>  {
>         gfp_t gfp =3D GFP_NOIO | __GFP_NOWARN | __GFP_NORETRY;
> @@ -526,10 +517,6 @@ static int swap_writer_finish(struct swap_map_handle=
 *handle,
>  #define CMP_MIN_RD_PAGES       1024
>  #define CMP_MAX_RD_PAGES       8192
>
> -/**
> - *     save_image - save the suspend image data
> - */
> -
>  static int save_image(struct swap_map_handle *handle,
>                        struct snapshot_handle *snapshot,
>                        unsigned int nr_to_write)
> @@ -671,12 +658,6 @@ static int compress_threadfn(void *data)
>         return 0;
>  }
>
> -/**
> - * save_compressed_image - Save the suspend image data after compression=
.
> - * @handle: Swap map handle to use for saving the image.
> - * @snapshot: Image to read data from.
> - * @nr_to_write: Number of pages to save.
> - */
>  static int save_compressed_image(struct swap_map_handle *handle,
>                                  struct snapshot_handle *snapshot,
>                                  unsigned int nr_to_write)
> @@ -904,13 +885,6 @@ static int save_compressed_image(struct swap_map_han=
dle *handle,
>         return ret;
>  }
>
> -/**
> - *     enough_swap - Make sure we have enough swap to save the image.
> - *
> - *     Returns TRUE or FALSE after checking the total amount of swap
> - *     space available from the resume partition.
> - */
> -
>  static int enough_swap(unsigned int nr_pages)
>  {
>         unsigned int free_swap =3D count_swap_pages(root_swap, 1);
> @@ -930,8 +904,9 @@ static int enough_swap(unsigned int nr_pages)
>   *     them synced (in case something goes wrong) but we DO not want to =
mark
>   *     filesystem clean: it is not. (And it does not matter, if we resum=
e
>   *     correctly, we'll mark system clean, anyway.)
> + *
> + *     Return: 0 on success, negative error code on failure.
>   */
> -
>  int swsusp_write(unsigned int flags)
>  {
>         struct swap_map_handle handle;
> @@ -1077,12 +1052,6 @@ static int swap_reader_finish(struct swap_map_hand=
le *handle)
>         return 0;
>  }
>
> -/**
> - *     load_image - load the image using the swap map handle
> - *     @handle and the snapshot handle @snapshot
> - *     (assume there are @nr_pages pages to load)
> - */
> -
>  static int load_image(struct swap_map_handle *handle,
>                        struct snapshot_handle *snapshot,
>                        unsigned int nr_to_read)
> @@ -1190,12 +1159,6 @@ static int decompress_threadfn(void *data)
>         return 0;
>  }
>
> -/**
> - * load_compressed_image - Load compressed image data and decompress it.
> - * @handle: Swap map handle to use for loading data.
> - * @snapshot: Image to copy uncompressed data into.
> - * @nr_to_read: Number of pages to load.
> - */
>  static int load_compressed_image(struct swap_map_handle *handle,
>                                  struct snapshot_handle *snapshot,
>                                  unsigned int nr_to_read)
> @@ -1529,8 +1492,9 @@ static int load_compressed_image(struct swap_map_ha=
ndle *handle,
>   *     swsusp_read - read the hibernation image.
>   *     @flags_p: flags passed by the "frozen" kernel in the image header=
 should
>   *               be written into this memory location
> + *
> + *     Return: 0 on success, negative error code on failure.
>   */
> -
>  int swsusp_read(unsigned int *flags_p)
>  {
>         int error;
> @@ -1567,8 +1531,9 @@ static void *swsusp_holder;
>  /**
>   * swsusp_check - Open the resume device and check for the swsusp signat=
ure.
>   * @exclusive: Open the resume device exclusively.
> + *
> + * Return: 0 if a valid hibernation image is found, negative error code =
on failure.
>   */
> -
>  int swsusp_check(bool exclusive)
>  {
>         void *holder =3D exclusive ? &swsusp_holder : NULL;
> @@ -1631,8 +1596,9 @@ void swsusp_close(void)
>
>  /**
>   *      swsusp_unmark - Unmark swsusp signature in the resume device
> + *
> + *      Return: 0 on success, negative error code on failure.
>   */
> -
>  #ifdef CONFIG_SUSPEND
>  int swsusp_unmark(void)
>  {
> --

Applied as 6.19 material with some edits in the subject, changelog,
and updated code comments.

Thanks!
