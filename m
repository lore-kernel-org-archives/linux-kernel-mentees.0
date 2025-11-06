Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0992F5A25
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  7 Nov 2025 01:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762479235; cv=none; b=lg/lSLcHQUCeVFDu8RhdH3xUf4RkluGVxXiVa1pgv1LH7+3X/YAqaMIXU2sXNFjodPBWGXiIkD18nCYVm3DtbRPtr7/wqY1YKr1yulXba4F/fH4LNPAb1knmNDRrVm085tJ3meQBxPtd4CJwqrAo2zkSo3oTOn1GkecO8AlOf7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762479235; c=relaxed/simple;
	bh=s4//rXzDBRVBNwADTTn5nejLJJDM9DaWd5NHxwgbfFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vBfwqhafmimvKGAfXTq1GF85mv7C96Hqu1w0Ztalwi7Z9VufI3VN2XbrBcDkxesN/ux9Y/jAM8/FR/OHrZHvtukHXTsPcXdn0HVF6/ukWalqmGotqLLXTOwOxfmg+v1kHoPVH7+us92f7bIuiamngWhluEzTPj8sKy/x76rlr+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0NfonED; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0NfonED"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6409e985505so375178a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 06 Nov 2025 17:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762479232; x=1763084032; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s4//rXzDBRVBNwADTTn5nejLJJDM9DaWd5NHxwgbfFk=;
        b=l0NfonEDvZUzBBWlBvmkBnQ0ciN0uOscFNupOe52DpMwkyHzLWa08kc+NW/Vcj8X2n
         RJxUefcn/EfLd9z5eqaTvj3UaCrSsL3TS6etrAzvCp8pclCXyXuKcj3Mco9/iiFBoLSs
         NPq0ICKRQGBXr7B/MPmZabfZsxukgNoI+S91aYTbn6BLynDOUjLEl2DlZ6wk5Kb6PPoi
         WHOYkKUMpZaoBkMFvxq4p1+hCTEl7eng5irwWslzp9pUAHR07D4QOfdNvC5/g1acLxPf
         lMSgAnxyaRGRloLe732JScW4tYJMWRWMZGA+T9Fa5t4xhY7wIJ/tKTuqAeDBPE1maBnR
         k84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762479232; x=1763084032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4//rXzDBRVBNwADTTn5nejLJJDM9DaWd5NHxwgbfFk=;
        b=GBVhy7xTehweFZG+wSvRxUl0kpYRhpIDU1GPQnPNR8hmvxLZOAksB8dF5DIcUReSwU
         bcghqFuOeTh0Dz/mT9rHTWmqaV7IzDSPSRmVb/vue3ZudhmF2nhn/PrmFS1TGldgp2nb
         pcBfju5thS5gcnL+iepzVv60XjEfedKEJV2U4R1hf1gcJHiIU765W4yjvv+TZNURp1KD
         g3G0POGRa8DSeKFz4CQrLkc+uWHcM9gqhwxDYJEMru4B/Xlr1gSTT4aPdknfBSgDkltQ
         362rOLeRemXgDXVBFhJA6SZPyI4/EM6NX10BbmmQzsKa+pjmWXwIAEtKrpeY3zrJjvu9
         UyeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMgMj/2OB5hpfXs1hAOnpX8czt1SPOpUUSHTYiPFF4uNq3HNmtezojEdXb6FmT2o08EoNrT06RcBbkxD9qaQABMVlVdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDOppZpZsrGmYg5Wvq5hBmf63SYlLZ+ueVRkOpl4cZ1zdvpyWF
	GJKs6Nj3xl3NxCEym9y/X/MRGlupJ7wH49ZF2rSEXYYzRGLbbg2yknvO1aMnwFrXjFf2O/y0dhl
	Asz9VJZvU2ZVfAK/7nwy6Zj1s57+DBww=
X-Gm-Gg: ASbGnctULLlOKGcg62Q8l64zQdkE2PL6lW2jwUzgqYTDmO2JKhq0rqD7pghRdi0mVLr
	LYXgEBngVgdA78Oa+vaJguCXSh0QihUW+VVePM//zKHLX1JZfUtBgdU2phK3R7GfsUfiCsHSrFK
	7ANyUehdN1wEweSYH9yT4wV5x/UbsUTpzctBoPYseK9s1/TTaKm1ue6Rodew5jjcgmzc0/eOImx
	GXGPe7d94HObSm0RA8bdkUq9Xx7MJXpn0yWwyDREz9j7TPrYDhJuwglboMDKgoswWC3Wkj7WX4p
	xpf/cwkoC5AfwQANdiMBk/HWS1cuPctdFg==
X-Google-Smtp-Source: AGHT+IFs0p/ZshE8oSECFwYJl2O8ACKc9M/8ieJ8+hrmMK00uOd/hgBZgPKKUSuUkRJGeii5nbJkqvK+f3dDoKjW+Mc=
X-Received: by 2002:a05:6402:1446:b0:640:96fe:c7bb with SMTP id
 4fb4d7f45d1cf-6413f0f3f18mr1383801a12.28.1762479231677; Thu, 06 Nov 2025
 17:33:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028174222.1739954-1-viswanathiyyappan@gmail.com>
 <20251028174222.1739954-2-viswanathiyyappan@gmail.com> <20251030192018.28dcd830@kernel.org>
 <CAPrAcgPD0ZPNPOivpX=69qC88-AAeW+Jy=oy-6+PP8jDxzNabA@mail.gmail.com>
 <20251104164625.5a18db43@kernel.org> <CAPrAcgMXw5e6mi1tU=c7UaQdcKZhhC8j-y9woQk0bk8SeV4+8A@mail.gmail.com>
 <20251106141259.60e48f1e@kernel.org>
In-Reply-To: <20251106141259.60e48f1e@kernel.org>
From: I Viswanath <viswanathiyyappan@gmail.com>
Date: Fri, 7 Nov 2025 01:33:38 +0530
X-Gm-Features: AWmQ_bkJ2FriPSSvVAi2fzsx9ERxZ0UVfTFti4bNiLHi8cCqoPmyaQ1vev0pUMY
Message-ID: <CAPrAcgMtF0cKkJ3RAGbCPozcK7YRdnYOg_tp98kLsXb_nQ9ycg@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH net-next v3 1/2] net: Add ndo_write_rx_config and
 helper structs and functions:
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	horms@kernel.org, sdf@fomichev.me, kuniyu@google.com, ahmed.zaki@intel.com, 
	aleksander.lobakin@intel.com, jacob.e.keller@intel.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	david.hunter.linux@gmail.com, khalid@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Nov 2025 at 03:43, Jakub Kicinski <kuba@kernel.org> wrote:
> The objective is just to simplify the driver. Avoid the state
> management and work scheduling in every driver that needs to the config
> async. IOW we just want to give drivers an ndo_set_rx_mode that can
> sleep.

Fair enough. I will start working on v4 with virtio_net
