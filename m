Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD0D15C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Dec 2023 02:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmZWmFW6"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C74836D5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Dec 2023 02:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00C74836D5
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CmZWmFW6
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F641SQ-0PBVU
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Dec 2023 02:08:21 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 45536836CE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Dec 2023 02:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45536836CE
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cfc9c4acb6so3384315ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 06 Dec 2023 18:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701914900; x=1702519700; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sqe6+ODVrguz5c8m6TdqeAPB2/cG6oAt7NcdDHwUniU=;
        b=CmZWmFW66aKzNgWtrGW4no3vxs4yLeaj7tjZX2+7QbhltAxQT+6vS0LSPF8p0gfyHh
         EnQqCrLyGsrNl+AUuHfUKMsL+fXxTLWby9SSvA81nksggm/fh6vvsPaH1PBRucqO5+YT
         0H1nJL8VUC+SwU+fiVwKm289SGfzVyCWpj5FZ7TJeTbT+0S1PXQVuuQ8DhtoDGEoL6Hf
         Qph1C6Tsr4Xf8cZEEtwXjh0Aoj/DTTdKtaNrlHGogREQKHGtgMdkA4Gsgx8AqDRPbKWk
         qqdamTHghzoRzRlog2uO76JxZIjNO3YSJYqrk+C5TLGL9DIifkfaXPzHsRLh11DJOIFC
         KvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701914900; x=1702519700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqe6+ODVrguz5c8m6TdqeAPB2/cG6oAt7NcdDHwUniU=;
        b=bk6HI3JqzOX7nAsmGc8J+DCfUsXbGShtRk23PEVdD9csyNV0Q7gc3xYHEVwuDlrzUg
         43gtu75YxZxtEvrSJw0LXvrAU90qEwuX7CT8DYL+oVx9QXNEjKxR2WDyLKKpPiupXsBA
         I1ZehrbEc00XekKH8jBHeMQK4ky18/jVyxcTqNZKjKBwNMX+kAyeDHS6QNnewtd3kc6W
         FEF2PeDx4+Ij8w8Myp3rEdZb1cvSmGj+TyO7D08FV5xjy08zWhsFF4DCYaZQ0GcgtjLx
         Geer7vPaVriPN85nN+E846Y3fUdkSYuhx3Bm6hrI+PMwQ+ICT9CrEt3VXtiP9c2LgJqf
         XG9w==
X-Gm-Message-State: AOJu0Yx+VCc8NwWIKzMKcyq+GHDc5twEYjtgZxtfqbpAmc6D1+nuusW8
	G8Z6euAVVFfSWSLNMeYMeeU=
X-Google-Smtp-Source: AGHT+IHPRst44H7aADvFNJUY3LQZsthl1oUhVIkM1K+oRkzR1qeJh9MJ4cy8hsX14yq/SLNbvhw17w==
X-Received: by 2002:a17:903:22d0:b0:1d0:6ffd:6e69 with SMTP id y16-20020a17090322d000b001d06ffd6e69mr1821150plg.97.1701914900387;
        Wed, 06 Dec 2023 18:08:20 -0800 (PST)
Received: from swarup-virtual-machine ([171.76.80.2])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902eec600b001d087d2c42fsm131764plb.24.2023.12.06.18.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 18:08:19 -0800 (PST)
Date: Thu, 7 Dec 2023 07:38:14 +0530
From: swarup <swarupkotikalapudi@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v5] netlink: specs: devlink: add some(not all)
 missing attributes in devlink.yaml
Message-ID: <ZXEpDtDkKMTQwmwy@swarup-virtual-machine>
References: <20231202123048.1059412-1-swarupkotikalapudi@gmail.com>
 <20231205191944.6738deb7@kernel.org>
 <ZXAoGhUnBFzQxD0f@nanopsycho>
 <20231206080611.4ba32142@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206080611.4ba32142@kernel.org>

On Wed, Dec 06, 2023 at 08:06:11AM -0800, Jakub Kicinski wrote:
> On Wed, 6 Dec 2023 08:51:54 +0100 Jiri Pirko wrote:
> > My "suggested-by" is probably fine as I suggested Swarup to make the patch :)
> 
> Ah, I didn't realize, sorry :) Just mine needs to go then.

Hi Jiri and Jakub,

Thanks for your patience and support.

I will send the new patchset tomorrow with Jiri comments fixed.

Thanks,
Swarup

