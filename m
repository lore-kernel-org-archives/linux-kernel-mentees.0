Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C224347FE2
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Dec 2025 07:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765956968; cv=none; b=MjOihjnvN7YB31Jo9qS9qNd4sy5WPzXqu9a9O0ZRkH9lydq4Hd+SIWl7PKq3I2ETme0ppdOT2bdpVFRW1dj442swWFrC56l875sJeMn197os8OtJgjxfC72Pb3Jp2GeoVNcENaG1wrcrRixeCTKe/8A66TvHeLLqGhCA1rjHjpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765956968; c=relaxed/simple;
	bh=Vj99uIVLpyM5fVIEraK9l4Rt5e8dS3EZWhTtbZaSxfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLr5rF64Rs0blmT/Qo8v5kPwhc4PwJOR6xsx8fPve2kRo/PmOH+AF+xzZH13YcTn9U/3Dh93xhUvMmzyI/u3A2xwY5TMGOPRWu3IMmbXh9oUlmmOOcQ73GJBQiW+se5Rn9uqTJWCdTqU62O9Nvp+TLxGNn/cUfUDHU1syr6sM+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgPFwYee; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgPFwYee"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5dbddd71c46so1938458137.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Dec 2025 23:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765956965; x=1766561765; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dNyhTpSpLnqz679/e0vOnYIzAms/0r86aw8voZM4hA=;
        b=PgPFwYeeybcfUlhdBaXAM7wAMyLayZ9nYE9URmRL94w/g+SkrmvVm/MpI3OoFthwDt
         uyEr8xgSuYWh/FsqBbVnfqb1cYckEiGqHR5IhJaDUxJ5PZ1dwAX7byVlXAByZayGsM2m
         K6456y5SXtEgOwcyRFijfBj0E5TwAH7lP5yBQXr9Lb36Cm40tcNqVt2jjxfeD9/94f6X
         zGTy8Vxavfq3KVRSkARBuP0M71SxZgJzsPZrudA4Y6MMa6CYseuMnk2MxCYsq112LuKY
         jU9q54csRHZKx4NpiBgm7IEUvAAS5lhuKAaLkqZgilsP1v0R2I8O/dHrXyL1sbtS2zkm
         DYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765956965; x=1766561765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6dNyhTpSpLnqz679/e0vOnYIzAms/0r86aw8voZM4hA=;
        b=M41vUzNJ0RyyHvkDoUZRjMWmbcWH2iNdnk6JVb7oYEn1SAmK2q0pZZ/taPXCG6d3LN
         ZTqCD13S0DwQx/J0gfRRfFs4JlLolFfIp4sJYczrDYRtxgbSVQvY+w6HFxNyHsKvXphc
         OgB+sq5S02N/CmL+VBgEXRi39LXFDxa44y9f1HOvIjHv6jKh/OspoYyV3u5JolnPWERv
         oowRRkmV9f1p+wHsIv/VjOkTRqCz6PFR7l0lNZwKvuT3MD0cWnBeQekopX6sJ5AbrpRC
         rlhoqUyH0Jd+3xwbKZ4OzI2zYGOWcOosv603JI/u0OaIr6NvTfLkibM5HBVYFy6Fy+fM
         v41g==
X-Forwarded-Encrypted: i=1; AJvYcCW1f2REl/cLpKQd/AAOwo0dGb+WkBOHk4K+dIr+a1bwS5S7pIQiW66npx2StLCJDwgAV0XWmA88qddRKv7zfRKr5zVhzg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe5vLvZLmcGiZ6o+Ab0diud/LPhY//1WPUrGI41UB8uF2szbAi
	6JsuN/pc0lY5/0sf2qzig5ihlr4YuzWYChEatjk+v5YENKGKM3g2AztabioRZeqfn0zNrpNjQD5
	Jt9RVINzjXY1q8pUQkY97yvrvnXbi2NM=
X-Gm-Gg: AY/fxX7PTVSb2ntE03UTLFKAISbOJqsERGN4z7a0EW8TSK14sSK/u5HPyy4Z39kCjNT
	a3nES395Ow4KEFaKkI+Y1WLllA2VB3OdODA9K6ebBBte81jsFC1VD7GyMH5iI99L2ULAJbTBiDn
	5/n8djr4N6ObByQJiBvn4bTpTi+nJaicp1P2EGfj7AGcrd4I3oHysaH8cdplBigfIt7dksH3e3h
	lzMub2+BEIfHJBEW/xVyyMEUOHAvmdIsqBHvbQQrSSfhdwb7iiN71P2fewaE+3fWYv1qKJ1k09E
	OALr4di94TICeJ+1Mu156Wb/A8Hy1ynU2i/i145Ch0Ia6k0Z9H6FNhQ=
X-Google-Smtp-Source: AGHT+IHoOilXX2tYt6VKs/+VZVH5E6fzTigLpYxP1N0APgZuOX45PqYNuxz2CQWPNv8m/FuqMJFOaTMYnLo1o2ptUh4=
X-Received: by 2002:a05:6102:26c2:b0:5e5:66c6:d23e with SMTP id
 ada2fe7eead31-5e827696622mr5162798137.1.1765956965026; Tue, 16 Dec 2025
 23:36:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251202063748.1210359-1-kubik.bartlomiej@gmail.com>
In-Reply-To: <20251202063748.1210359-1-kubik.bartlomiej@gmail.com>
From: =?UTF-8?Q?Bart=C5=82omiej_Kubik?= <kubik.bartlomiej@gmail.com>
Date: Wed, 17 Dec 2025 08:35:56 +0100
X-Gm-Features: AQt7F2qfPoGe3ZAHY4GZ7cQyUXN8h0AdGuZ-5_qQ4hLnf3ADLAFZIJkewT4znR0
Message-ID: <CAPqLRf18v3eQaKsaaf+wB6k5+v65=BkQG2dtS=Bcyee=isOatw@mail.gmail.com>
Subject: Re: [PATCH] tty/n_hdlc: Fix struct n_hdlc kernel-doc warnings
To: gregkh@linuxfoundation.org
Cc: jirislaby@kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com, 
	skhan@linuxfoundation.org, khalid@kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I submitted this patch about two weeks ago but haven't received any
feedback yet.
I wanted to check if there are any concerns with the patch or if any
changes are needed.

Please let me know if you need any additional information.

Best regards
Bart=C5=82omiej Kubik

On Tue, 2 Dec 2025 at 07:38, Bartlomiej Kubik
<kubik.bartlomiej@gmail.com> wrote:
>
> Add missing descriptions for write_work and tty_for_write_work
> members in struct n_hdlc.
>
> This fixes the following warnings:
> drivers/tty/n_hdlc.c: warning: Function parameter or member
>                                'write_work' not described in 'n_hdlc'
> drivers/tty/n_hdlc.c: warning: Function parameter or member
>                                'tty_for_write_work' not described in 'n_h=
dlc'
>
> Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> ---
>  drivers/tty/n_hdlc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/tty/n_hdlc.c b/drivers/tty/n_hdlc.c
> index 4a4dc58b866a..ac0605ac9d46 100644
> --- a/drivers/tty/n_hdlc.c
> +++ b/drivers/tty/n_hdlc.c
> @@ -127,6 +127,8 @@ struct n_hdlc_buf_list {
>   * @rx_buf_list: list of received frame buffers
>   * @tx_free_buf_list: list unused transmit frame buffers
>   * @rx_free_buf_list: list unused received frame buffers
> + * @write_work: work struct for deferred frame transmission
> + * @tty_for_write_work: pointer to tty instance used by the @write_work
>   */
>  struct n_hdlc {
>         bool                    tbusy;
> --
> 2.39.5
>
