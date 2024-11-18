Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A165D1B2190
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Nov 2024 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731942141; cv=none; b=UGL4FceTIkWNMMxbOCyk4GbOeJpI9apC8Or9ABGo7XEmjOzdn8rcBp4FkM0VDczh3kdQ97SYwQ0rvPjvdNELEFBBQX+TOlxUUEd+Th+Blp3kk2+XKrMccxLTT1NDB4q/+iEiO9CfUObcJEDC1a5Bo7lcsUDtTCBJ+FDZrn5va2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731942141; c=relaxed/simple;
	bh=0w2OynbYO+nrOmy4rb//EdFOurhjemtoUWrgafapEz4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=srBw7aI/tKbZKfYA7X595HznqCV0HWfFdd0pW7VUyR4jB6eonXefXoSugYcJqAFmj1/vE0zczwZaVxVM1tFkPpYhDQv4Kg+EGunUjwgdeqAj18A+4z4XeqLVWjWLae/MuztROuWSpxeWZFzSHamn4wAbNalcvg81NTo+JWtHzEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3X08eh7; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3X08eh7"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF66947F82
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Nov 2024 15:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsdqZcCIlTZq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Nov 2024 15:02:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=willemdebruijn.kernel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DE1F647A21
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE1F647A21
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P3X08eh7
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DE1F647A21
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Nov 2024 15:02:17 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6d41eeca2d6so10302346d6.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Nov 2024 07:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731942136; x=1732546936; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRQSc3PSOGIXJkJ+LkMmHz+FFKZo/2EmDTEVlbJ4y0s=;
        b=P3X08eh7WJAKQwUdh4sU+akjkENKI8GwDHW21ueVC2SU3cgM4ZcsdGZdNd9RGxeTHV
         BI8tABYgjfHrcSSPPzaUaSEegpG5E/u2Xke2HPhMMeOmq3H46iiv3GAHoxYEUOtLqK2S
         2A++uy4bD1UNlO0TEGWR/WBtSsiN0GnggpyOmgbaE55Lvoa3l9o3c30cnjOwVIKQ88J2
         7Tt3I5NAIvx3W/5TZ+pja6qyEvemHRHPBkAOlm+IXtJPpArazmmbH9y2PVzCMQ2NBxhW
         4Ftl73Xrsl/rwEMsxA4fBWwSr23sflVmp3RGTedPoqfgf4SbMwPOr0WtEiOnuVdbLGVh
         fDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731942136; x=1732546936;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SRQSc3PSOGIXJkJ+LkMmHz+FFKZo/2EmDTEVlbJ4y0s=;
        b=gEXZskM58xMUTRnFMQbyEigxoUfpw9jNKC42UIXYEfvx4vyvva40fjFKu9RcNwqI2f
         9SH5/0TjHAVvd1Kd7YM195j730LL0Ey3WxczHKOkJ1VD4hk+lBR9PuZKRIQ7xLMTD29j
         0xTqhS560vw7/j9fPPxeYxk9kjTmbLHeVxZfYmyWPJByUhiepllwFxMDic/Cl6+kxHtj
         iQ5SZUAFSv8BQhyR3201JSaJW3/doX6wb48MjDQHJHIgW/iMGxD3ax/TZuAm+hJTS/os
         Ygtsyr/SebQldWy3kFfFdsc/ZQvSD7ArW5pQzUswg1/MGlRDuh/uYMD9pqVAmqlG+gOo
         lojw==
X-Forwarded-Encrypted: i=1; AJvYcCWJIsSEXLmzjMpVsAvgOjYmt/IQH/Vg1QXWyeCxglA6wchcYSCzf/1MjbxlYC50fex7QvN9gxiWn+cEBhCDdXAtekcCCA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzePyQzfOD4AnFRNYn738Pful2dWowLCB/7i8dlW3W62oJuq/3M
	CinKI1Srs08Q6neGmrICmc2tDg7jOVuQLuZLhjkfmkBoimsxyb8+
X-Google-Smtp-Source: AGHT+IGhgA/dHGCFIDyrq3rPlb1Z9bnrCzNhZrK1350dn5qjCRp6cQgukK65MSUGUxo/DnEb27XNUg==
X-Received: by 2002:a05:6214:2f85:b0:6cb:d4e6:2507 with SMTP id 6a1803df08f44-6d3fb802d51mr166801986d6.22.1731942136360;
        Mon, 18 Nov 2024 07:02:16 -0800 (PST)
Received: from localhost (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d40dd205c6sm36585216d6.89.2024.11.18.07.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 07:02:15 -0800 (PST)
Date: Mon, 18 Nov 2024 10:02:15 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Leo Stone <leocstone@gmail.com>, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 shuah@kernel.org
Cc: Leo Stone <leocstone@gmail.com>, 
 netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <673b56f7768fc_1ced1f294fa@willemb.c.googlers.com.notmuch>
In-Reply-To: <20241117225950.138968-1-leocstone@gmail.com>
References: <20241117225950.138968-1-leocstone@gmail.com>
Subject: Re: [PATCH net-next] selftests: net/psock_lib: Handle EINTR and
 EAGAIN
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Leo Stone wrote:
> Make pair_udp_send_char handle EAGAIN, EINTR, and partial reads or
> writes.
> 
> Signed-off-by: Leo Stone <leocstone@gmail.com>

Did you observe actual issues or is this based on the comment in the
existing code ("Should really handle EINTR and EAGAIN").

AFAIK all the users of psock_lib use default blocking IO, so should
not see EAGAIN.

A simpler approach to dealing with EINTR is to ask glibc to restart
with sigaction or siginterrupt.

> ---
>  tools/testing/selftests/net/psock_lib.h | 39 +++++++++++++++++++------
>  1 file changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/psock_lib.h b/tools/testing/selftests/net/psock_lib.h
> index 6e4fef560873..e28bff95c8e2 100644
> --- a/tools/testing/selftests/net/psock_lib.h
> +++ b/tools/testing/selftests/net/psock_lib.h
> @@ -13,6 +13,7 @@
>  #include <string.h>
>  #include <arpa/inet.h>
>  #include <unistd.h>
> +#include <stdbool.h>
>  
>  #include "kselftest.h"
>  
> @@ -110,21 +111,41 @@ static __maybe_unused void pair_udp_open(int fds[], uint16_t port)
>  	}
>  }
>  
> +static void read_write_checked(int fd, char *buf, size_t sz, bool is_write)
> +{
> +	int bytes_processed = 0;
> +	int ret;
> +
> +	do {
> +		if (is_write)
> +			ret = write(fd, buf + bytes_processed,
> +				    sz - bytes_processed);
> +		else
> +			ret = read(fd, buf + bytes_processed,
> +				   sz - bytes_processed);
> +		if (ret == -1) {
> +			if (errno == EAGAIN || errno == EINTR) {
> +				continue;

Instead of busy looping, on return with EAGAIN should probably block.

> +			} else {
> +				fprintf(stderr, "ERROR: %s failed, bytes left=%lu\n",
> +					is_write ? "send" : "recv",
> +					sz - bytes_processed);
> +				exit(1);
> +			}
> +		}
> +		bytes_processed += ret;
> +	} while (bytes_processed < sz);
> +}
> +
>  static __maybe_unused void pair_udp_send_char(int fds[], int num, char payload)
>  {
>  	char buf[DATA_LEN], rbuf[DATA_LEN];
>  
>  	memset(buf, payload, sizeof(buf));
>  	while (num--) {
> -		/* Should really handle EINTR and EAGAIN */
> -		if (write(fds[0], buf, sizeof(buf)) != sizeof(buf)) {
> -			fprintf(stderr, "ERROR: send failed left=%d\n", num);
> -			exit(1);
> -		}
> -		if (read(fds[1], rbuf, sizeof(rbuf)) != sizeof(rbuf)) {
> -			fprintf(stderr, "ERROR: recv failed left=%d\n", num);
> -			exit(1);
> -		}
> +		read_write_checked(fds[0], buf, sizeof(buf), true);
> +		read_write_checked(fds[1], rbuf, sizeof(rbuf), false);
> +
>  		if (memcmp(buf, rbuf, sizeof(buf))) {
>  			fprintf(stderr, "ERROR: data failed left=%d\n", num);
>  			exit(1);
> -- 
> 2.39.5
> 


