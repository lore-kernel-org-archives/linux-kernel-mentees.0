Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E244439182F
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 08:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782117729; cv=none; b=ph+E75591WbRZ4sJ9KzvC+D4WjjGZTw5AalzYub7CK5nbQOhCENv9fIh3h07k3p/xmdM83siTpKBymM3tmDU5bpQhSViGbkNcwF4MmBQ+zx7wZd1tpC9yk786ENobBuhTTVWihNBXOkAehrKi9zrEYGg2ONM700ZDEI7qNcB8ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782117729; c=relaxed/simple;
	bh=9x5gGNzm/CgGZAAOloa8x0P1VWHqZMFZ/VdZWA1YZ6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=os+YjCjInkIwkxQ1gTPlkiTIFJQXDwe/BtONERzA4Kriz5g/5okDxuTU5nMp0DZVPpoH4F7tgYF7EpfM6h2tzetAUmj3oX2kQ6mrHPRwsQKniuBR63NG+l5m4Bi84hmfSAO9Y0Rq0vPjl3PUCDAHcr5jvBypqO05Rt5J+sFpLiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiJ6rf2K; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiJ6rf2K"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6977c0814d1so2705306a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 01:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782117726; x=1782722526; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nXaROWcX8niDcdghF4hGnIFPotv9p/zfW7hZ5AJ/2K4=;
        b=iiJ6rf2KQ4ol9mfMQMJ2Sn/SzJyOFYAL12ydQVNzzvUdLAoVeq85dFXQvwENivWb00
         0Anc4IzVzoJAAmMY83zS/emclUgRL7E85tlEng/lPGwYRBKmSD9Gc1MzBkUaI/ZYqwxP
         ofn5nd+b4TDhrg7kNewy90Qax8aZl6XFUdEQAGNB6UEsa5rDSCuQS+LnwaNCIb8BREue
         cK5WfAmYt0vU+ILA79IEpqo44EdtObLzaV8J8BOcWZV1Yd30bPfqMck0QkeIV/oVYVqx
         r+DtUbTouDq49mQE2knXQ9uSKvEqGgzpBianetbak7t7hGkhsS4YkXi6D8afEf7b/pJS
         V56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117726; x=1782722526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXaROWcX8niDcdghF4hGnIFPotv9p/zfW7hZ5AJ/2K4=;
        b=MOHs8uG+VsGh4uvYKFF0HzyvI2CO19TfsTgdg0tM35Hs1vdVdocr5WTY2jnTdq+84p
         sNpDYhW4hnPWs9GmO9+xIe5tiRaPTLNEg5+1cA00e7THu8rg9mGtG5HFl84dIH0PXxya
         wAih+Vi6T42KZdBmQ36q14ZseYUgPG5fTHtdcRyE2yUrM8XPBhYwGomUjP9fj2Mh4MEI
         bi6RZFxmIWgFsEugLMyeHAhzMcZEFCWOsQ7jsyU4gYDo7GqmNToEFy0pYoM52ccj1pCg
         4lrZX0PNpTBsifkrJ9oEkE8s6ZvyHmMK7Pdm+gAlglzaLJVzjIga0bd5k8CBJxEzvHuu
         15jQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gbYSwLBIcg+0crRNxn4GQoBd5vhb9xg9sGGyCPY/JFHhcbq2bEy3DVhG1HtY073S3PEgJGDW6qQGen08lLGEuVmCQsg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWZPTwpOJ2uSBe7VJc7T2bQYVJC4g5BwYh6OGeBicn3aWgSUMS
	WAIwvBYzWmnokRxkg4b7DCIMWHZDT26ohkMVSXsMYFdJ+ksPfmnihxlZ
X-Gm-Gg: AfdE7ckOTdEYlnZgs0zGFAW+bdTlkxRdXWr8X11K9fRvSc3G4MYSxO06In8on4xOsp3
	3NodHDLAXnbgQLPyFWv6sH0Qx31YccWv6FfYG6z6F8+Sw/6G9tbMJfyz0vxgiwBwiN7h0zlBB2T
	H1kV6Xnn/AhAyz2d+FejRoc+gj16bR4e6My0HR9UwHchV0PIgB1uREkmhOTiOhaAqGt29C5TF98
	0BFsJrO/eBy53SDo0oJ7Rz8/4TCyo0xlu+pVvN2k2riJ7C7aRn6Ab8ZxACTWrVGy7WQxrRbQ1zu
	Bjk4ZkQ7IuTxK0A2fS6f/LAuR9aPpUjbZidJZXne2ImZa6YLhiPo2F9/dBNyR6GYUJhRoNmRD/w
	HjitGKKzgkT4JWkwthqADbMGDG5Z9O4R7cfqFRILOTCpbitzKNJdsJh1TH7Rp83+DNQA9KF41+s
	THQ0lZKllP
X-Received: by 2002:a17:907:c01c:b0:bec:687f:6603 with SMTP id a640c23a62f3a-c097c0af677mr640172966b.28.1782117726151;
        Mon, 22 Jun 2026 01:42:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be30b35sm2545215a12.16.2026.06.22.01.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:42:05 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:42:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sajal Gupta <sajal2005gupta@gmail.com>
Cc: linux-raid@vger.kernel.org, song@kernel.org, yukuai3@huawei.com,
	tomasz.majchrzak@intel.com, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] md/raid5-ppl: convert pending_flushes from atomic_t to
 refcount_t
Message-ID: <ajj1WdhoW-Y3GE4Q@stanley.mountain>
References: <20260622080656.22786-1-sajal2005gupta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622080656.22786-1-sajal2005gupta@gmail.com>

On Mon, Jun 22, 2026 at 01:34:32PM +0530, Sajal Gupta wrote:
> The old atomic_t based counter allowed ppl_do_flush() to continue using io
> after it could already have been freed by ppl_io_unit_finished(), leading
> to a use-after-free.
> 
> Convert pending_flushes from atomic_t to refcount_t with a proper ownership
> model. The creator holds a reference for the duration of ppl_do_flush(),
> and each submitted flush bio holds a reference until its endio callback
> runs. This makes the io lifetime explicit and removes the need for the
> second loop in ppl_do_flush().
> 
> Fixes: 1532d9e87e8b ("raid5-ppl: PPL support for disks with write-back cache enabled")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/all/ajJF2wKYWRk4GGCK@stanley.mountain/
> Signed-off-by: Sajal Gupta <sajal2005gupta@gmail.com>
> ---

Have you tested this at all because it doesn't seem at all correct to
me...

regards,
dan carpenter

