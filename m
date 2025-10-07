Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4362DC334
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 08:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826132; cv=none; b=SUl+RIc5rMftSBi7r15SVZ5lcQSUk+KETr5MGp3isheebdpAZlFv42mdye+daQS+eqZqhKBmy5AtLcNvYobgKjSWrk9ZkuTUXzwgPmJKb89Mbd3zqC/hics8S6nWmhW5z30qp8Uw2voV2rMZnHGyfwRN3VexrH0Uc3iKzTWLG0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826132; c=relaxed/simple;
	bh=oolnhmzp0phxU0SJgt+ZTKmKtIqlWNaICASfkcDvAXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXzVmPDjnpJUBMQmtwFMQDhiYZ9rfleuDJrYQCZQ1w0K7gB3q01tHwgiZUbP36J+ubaMi4bnxMjM/V2bOlHB+iEsTJGQcLodY8aEUgF5e1KWWeycngo3yfh2m8lVa48brwf8AoHnSeqQ1uYjVYrqTsZnr5Zpj7gs3rbWskRtvUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+YDgNEk; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+YDgNEk"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso13693229a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 01:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759826129; x=1760430929; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oolnhmzp0phxU0SJgt+ZTKmKtIqlWNaICASfkcDvAXg=;
        b=H+YDgNEkg3lTrJN600836WOqW39eDTKgQG59UCeyP6yF9a7CgpGGAsFA0UI0wC0M1I
         0pOshJJKPRc+XTZ9cS1efTC8LP4xZipPgUXMi/xgNey+t3LvL5YSYlBRybH85/bz9aVt
         65yeI4AiofE4a/rHlNC1XeCwupOzMUeRp9VqnvJ6xQMh4WpzRMlRTynRexs6NH1rLB2K
         c22aA/sBw3vqMMa1PiiohzA8EJHkRy3C0vFuphE8HogllnfazGzCO6JYRp5kZZgttkrc
         LC25SQTWGTytOLMAf9v89tRqsU+HnjIS2hvI7qOLqIl6tTlPgLfGnPECxDtgoHwwjbnm
         6Rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826129; x=1760430929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oolnhmzp0phxU0SJgt+ZTKmKtIqlWNaICASfkcDvAXg=;
        b=LmaOpQYY11bqCmop7L76pWrOcsPBVknzr3gDT2UraSfe2k+SbFMb7cxMjO2Xu4gqZm
         AaXB1bY0v7i9P53u9iwMhIyITzbM8gJ96HTYWWhoQmvTtxV7I+yz8iziF3wj7nkbp4bP
         j2K72ipILmOOYYrGoGe//z7Y4RoMjVPPKuI8PsX4HM5KQ4zaibLqOgUV7d2FFIypf5so
         aFruwN5S/0eNUxzBwNqTvkJx/W0kUsrqUL1gSrE6DQihu4u8+6EVp2syGAGiPSFKgeTg
         /gAuGI5QvD2W2rpXny6xOj/cjGgrcGpNaOgcF/nq9Tk4eDuaaHxt6ABYjmomXGBbhAk5
         Q0HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq5cNWzXZgbxEVrSuecXYn/R6DnkSpeApB02jV2qE46ktl+YbTVcICq0izvpOanNvESykZBrXKPoSBoydCbhTibx0XvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxTVf5cOYmhXAyC7UxCZXktLoq9OtxSQL0E1gmLyRV0tQkRcET6
	p/6tAwIz+21NXGW/9ca6k17nC1OicVhGUp19W4j10BY8yAsi7tOWZNkT9cNrA9YtN9/UkIZhhrb
	ym2ICswGeBarsG6pK8KHcI3YFra8jMeg=
X-Gm-Gg: ASbGncvDl+ixag2LPti80YnBiQCmPSz9V3kQSzRrlEgdD0ip7gGpGWEMDMgu6wfm3LX
	88KQNFEYG3qpveTZgJugpXUJLEAz5lliDnLM2c9wi0TBv58t351BGrwNh0wNUkP6BnJB99E5Mbe
	9ID5e8EHLGMA5CG0thSMMQEpv0qo8wK95prGumzINt+eWyH+YrALyRs/ANIljgv3r0wEF+PysBc
	oTVRpMSe1E38xg9qSyqLZSPyizoCQXWmdjvcdMw59IA/dlvqjMIXVMvwdVfI7saYiwcosxYw80T
	4Q==
X-Google-Smtp-Source: AGHT+IGGUtmjqlLFO7DiLm+f7ClYBfwyRmx5vn+CRzV63l76mmNZeJM8Zill3iy7if7XHgjFS3vA81VNOf3LznbQNyo=
X-Received: by 2002:a05:6402:4402:b0:634:a23e:df26 with SMTP id
 4fb4d7f45d1cf-639baf1c977mr3450695a12.6.1759826128502; Tue, 07 Oct 2025
 01:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251001131409.155650-1-viswanathiyyappan@gmail.com> <4124e1a5-fcd9-4ce3-9d97-5ebe8018207e@gmail.com>
In-Reply-To: <4124e1a5-fcd9-4ce3-9d97-5ebe8018207e@gmail.com>
From: I Viswanath <viswanathiyyappan@gmail.com>
Date: Tue, 7 Oct 2025 14:05:16 +0530
X-Gm-Features: AS18NWDAJv8Y2QJ0ase6hOWvYmv9Zfznp100Rlegb03D_vdoVYNFwHyKoTaLkY0
Message-ID: <CAPrAcgMny0eujytjZ9M+LZoQzzbFRtsDsYFQj8=i37wSLC+6NQ@mail.gmail.com>
Subject: Re: [PATCH net] net: usb: lan78xx: fix use of improperly initialized
 dev->chipid in lan78xx_reset
To: David Hunter <david.hunter.linux@gmail.com>
Cc: Thangaraj.S@microchip.com, Rengarajan.S@microchip.com, 
	UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, khalid@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Oct 2025 at 06:52, David Hunter <david.hunter.linux@gmail.com> wrote:
>
> Please describe the testing you performed.

I used the reproducer provided at
https://syzkaller.appspot.com/bug?extid=62ec8226f01cb4ca19d9 and QEMU
to verify my patch.

I applied the fix patch for the bug before my testing.

For testing, I set a hardware breakpoint at lan78xx_init_mac_address,
triggered the reproducer, and inspected the value of dev->chipid at
that point.

Without my patch, dev->chipid was always 0. With my patch, it matched
the upper 16 bits of the value read from the ID_REV register

Thanks
I Viswanath
