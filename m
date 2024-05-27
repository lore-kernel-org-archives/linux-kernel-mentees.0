Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2683A1B6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 07:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716796365; cv=none; b=AVNLbmoGRswGinjoRYZ0Sw4pn9hMRY62NaXuWYUCXFDyBBxK+DK1rm6qttBTw86+jOGMVvUtdbyJ/uDx5hwqJmX09paA1au3ONZdsD1elRYZxRCyZ7meLra2gUijk1ARtYPpnleg/hYGljQWGalwdHukPxrQSn1VfxibtbCtPI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716796365; c=relaxed/simple;
	bh=TM1t05Bam2TI9Og9Ycmjuz9Th+Jrc0NoOIk5tBLaklI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TWy8Fc1sBboJq83su6xOYmkBVi7dVCM62WzDp9BW9hZm+tZ6cYGxCFcMGjSzntfgvzLMQfwE41ixcKR6dVcGZ6P3VHiu7ZrZhPvigHo3Q5pNBYUBn5AAP9tMH214E4B0NwQh5CmHYLqVnJTy0SDA5oG4coDT9FQXKBTH+cWqc1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B5YwYia/; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B5YwYia/"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 301B36081E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 07:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxm2YgbhaQrF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 May 2024 07:52:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C716660819
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C716660819
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B5YwYia/
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C716660819
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 07:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716796361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=thc/L9s+2sOtDwAm/KUlb0xgz4MZpvoKHDvg7DhDHKo=;
	b=B5YwYia/+18OpxLDhAvqXwq75Ofgfmjr+yg+FKKkE1yawPTXoHMLhBkTMVtzh+84VjXBzG
	cA4HdBJTNockKpQELL8XgcjraxUvfd2wtJFzFbDatFMBcyJqxNiSfmYWycqsXoN6rYA1Hc
	GEAIKT4qB7VOsY51H9lJkWeNZ3z/58Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-1Gn5irrDNxetBlpQS9PkYw-1; Mon, 27 May 2024 03:52:39 -0400
X-MC-Unique: 1Gn5irrDNxetBlpQS9PkYw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-35858762c31so241705f8f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 00:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716796358; x=1717401158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thc/L9s+2sOtDwAm/KUlb0xgz4MZpvoKHDvg7DhDHKo=;
        b=pJrYkADYisQJSt6vcARmaQpMlc43RXXXPhfvCrTIGDmRNeflmQR86DxS/BFXTvQ4oR
         T5T2z5h2Z4c5kJhGg0P6aFOIaOWrHs1UYXr5f9c5rwPzJx0Vo7Rtx6I3PzcXZB/0SNYB
         DHtYuuef6B4oUSyIJNcX43brUN9yKOGCmJEcBAYkYgsUJKIAVJjiX91aHTMHWHFiZEA6
         wwZcd8iXHhrm8Ja6BWDpVbpUinoprGr6xJ6zdD8DGcnAPMNVSkFEgpSgNuy5kzgKrCba
         +1WxFpLJs+US/iT4b1CPPxezPWlL2ArI/bwQ5I/fEqovNmmEtWARQdF72wcOfq5y0G23
         BsNg==
X-Forwarded-Encrypted: i=1; AJvYcCW62r0MQTpfHdBg8B4Z6As4dtvBzNMrNGVT8kU5ObFFd4Clb8OvQtJQDuAfMfa//XsdHlU5r6TMXpdAX/7f6APl9vgkfdBhsuwFvQLw2pNJ1EI+OIhjlsgZQ4WnE/Zo
X-Gm-Message-State: AOJu0YxYLIVN18+ZGxM4Ctj+K2OFr2pWyi8RKA0ecPalr+yteAJYx9rB
	f9IdXxK62M9bbDbEVs0MuirHjEQk36SYS2zFkG+e7WnzyclG8zikcUYzU7rBhFYbbrCJsGzn3iO
	zQww43XiNQogVZqXJWVOYYf3DkaA74rwCA0XzH9N4TFabUNn+ItjUVtKWdW2OBX2U/qS+WGukud
	kYuXxNl9LtWw==
X-Received: by 2002:adf:ee8a:0:b0:354:f622:fc5d with SMTP id ffacd0b85a97d-354f75219a7mr9417775f8f.20.1716796358264;
        Mon, 27 May 2024 00:52:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUJgA9y8QUFq6+A/jElmXWEBdvPCJT9Gb6c+IL3oX/gqOcRBCgLttm/wO7nHhToDnUdxOC0w==
X-Received: by 2002:adf:ee8a:0:b0:354:f622:fc5d with SMTP id ffacd0b85a97d-354f75219a7mr9417746f8f.20.1716796357625;
        Mon, 27 May 2024 00:52:37 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:342:cd82:9c62:7faf:9d73:ba3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7d963sm8271015f8f.21.2024.05.27.00.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 00:52:37 -0700 (PDT)
Date: Mon, 27 May 2024 03:52:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: yskelg@gmail.com
Cc: Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	skhan@linuxfoundation.org, Austin Kim <austindh.kim@gmail.com>,
	shjy180909@gmail.com, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] tools/virtio: pipe assertion in vring_test.c
Message-ID: <20240527035009-mutt-send-email-mst@kernel.org>
References: <20240527071330.105268-1-yskelg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240527071330.105268-1-yskelg@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 27, 2024 at 04:13:31PM +0900, yskelg@gmail.com wrote:
> From: Yunseong Kim <yskelg@gmail.com>
> 
> The virtio_device need to fail checking when create the geust/host pipe.

typo

> 
> Signed-off-by: Yunseong Kim <yskelg@gmail.com>


I guess ... 

> ---
>  tools/virtio/vringh_test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/virtio/vringh_test.c b/tools/virtio/vringh_test.c
> index 98ff808d6f0c..b1af8807c02a 100644
> --- a/tools/virtio/vringh_test.c
> +++ b/tools/virtio/vringh_test.c
> @@ -161,8 +161,8 @@ static int parallel_test(u64 features,
>  	host_map = mmap(NULL, mapsize, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
>  	guest_map = mmap(NULL, mapsize, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
>  
> -	pipe(to_guest);
> -	pipe(to_host);
> +	assert(pipe(to_guest) == 0);
> +	assert(pipe(to_host) == 0);


I don't like == 0, prefer ! .
Also, calling pipe outside assert is preferable, since in theory
assert can be compiled out.
Not an issue here but people tend to copy/paste text.

>  	CPU_ZERO(&cpu_set);
>  	find_cpus(&first_cpu, &last_cpu);
> -- 
> 2.34.1

