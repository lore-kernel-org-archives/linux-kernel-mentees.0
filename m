Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB64379ED7
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 10:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782125844; cv=none; b=al8cOGfuBnUsmW/LZIq3J2VSaAmJcZjPdmjQckYKNiaw10e9644vhjDdjnV1dHO5sc72wlUQooAejMGFJObAhgcS0eDv4/0k0jLldhKPYZJE2903aL0H7eLky4DNaKWPfIkREv0mhPhZmfWVjOuX6fGwRIvSO7n0D1WHtBUsAKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782125844; c=relaxed/simple;
	bh=LWHVuMY1/ncBwfRP7JCD6/Wpmd4uhdg2Wme/B92jfYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vxq0JFEvc2tVy601maAqQIk0ljyjXlKY0Y05fdvQyVRgWZ5uMJVk2wvpENPteTEEJNa27iC6Nnvgh/mkz9BBSucR34WxwZ+nKZNeb+jk60vgjT+EjuiyZe708EOiC/Lrd7kxbLyAUHG/AmMErY1j/XBuZ757EkQNnivYp/Z7W4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rL8jrUMT; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rL8jrUMT"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c0115a3794bso768892966b.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 03:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782125841; x=1782730641; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWK0XbJl/m0yxPi2tihir84Vy/CVlnAxBTBF0YEc9Mg=;
        b=rL8jrUMTPmwTY6KhmoNaXU7Y+JJCkaZF1xx1xb+Oi6TfQz9JmDwONCwCQxu5pcUoWH
         vhS82i85AtBsCUzlY1TlI/LEEY9G+J0Nyex9qAWVjsjz5cCbdIFd4cv2u4HA28GxC2ly
         36XaD7H3K2fd31P/OHgz6b2ynSTRSCWQpNEaiUM7PFR2nX+QJoz8JfQ9w4WoAZGq3GCn
         8jInpM9qIJSf5RZNfcHFfm/WhpC9SEfh9TQxqGwdEj3fF7ubmPQ6TPJqEJMhn+6pBKxY
         zyxuA99DbGZW7KCJiCivYUsGqe95gH4o/c2WIHbYcvEKjrHcoQuufig0VX7LEimPII84
         0Pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782125841; x=1782730641;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWK0XbJl/m0yxPi2tihir84Vy/CVlnAxBTBF0YEc9Mg=;
        b=pQdtj3q7EsbtR1K7GjAZ7RGNnjofO8CxeBGE3qYPecIRZ9HMyMYN93cvH2pq2NWHk3
         lTQq7TyZWO/1K+SrxfqQfXkHCIkvTzo59Qk8lL69oqY0cPokwMb9zuLzKfS1gF0Zs5ME
         Q/PENsPQ2PLxdctysxiXi102XpndYap/3f3RilF0RBTZbvxvGjvP7dr6Olcyz6iBUN/b
         67gUo4o95eKY463UwUclsy16Hyj5wUrzxHm74PJpZQatCNSLIObdlXQHXSw21WbBY/Uj
         JBXX/b++xYSSTFTncU5Xq9eb4wf/sKG6jOUvmQzAAnGFqo32PjrMF39Gf3sFOMxl73ZK
         Rxyw==
X-Forwarded-Encrypted: i=1; AFNElJ8xy/LtoST1iy9AwkoywX8XcpfM6dFl5RwPWBj/rp+/HM1Ve54RVWmvxrcNTOsoTuFc3bdD00WQ982xtwkxFNH+Qz6/DA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ8f3dMF0Wgwhk40oQ5CUF+oN1TPnC3JnsznORzNIfR4WrVx2o
	u5nO7JBirkIzOZz3lQQADtiNVP0V7qbhC/UjJQvRWp6GUltarKiXkUBo
X-Gm-Gg: AfdE7cnPUbtrb5Q+MVcnQYuvk8jEa/U84QxYr0ggFXUz/nSVD892djX18Spc3yR2g8D
	7q/OAx48RC551STGsxYtqiKloIKeqdvWjomjF4gmTI18D9/p7Alt9Jd7U8KwknQXHlIpFRwfae2
	ia8T0X8EsK5+nBXoqZMj3pQXJFmk1bRNEKFo05Gd33nFrzhZCUybg3rvO6dEOpstdsMuHC8rZxh
	I5zkwMVHDwe/A50IxP+raJRhl87kTQjffr1t6XO8NQj6Ov4OrEY6/W1liF/cdGdINrH0X+exELc
	BLtMoOGxsZ1TtxZWHwsFeWPv48AW4q+uZ8PWmPFK+5xIKuqthpdPutnjZJcwBzNx2YFBWOtLxJ6
	sWlZGeQPSenwe10WVABSxYxhxiCODoogtwOAI2QOqId434TUsxFursRkx+IDdPOctIUrXztOJ+x
	u+iwyNvDFy
X-Received: by 2002:a17:906:ee8d:b0:c0f:c475:6bd6 with SMTP id a640c23a62f3a-c0fc4756e1cmr42963466b.13.1782125841003;
        Mon, 22 Jun 2026 03:57:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99b968sm335639766b.24.2026.06.22.03.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 03:57:20 -0700 (PDT)
Date: Mon, 22 Jun 2026 13:57:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sajal Gupta <sajal2005gupta@gmail.com>
Cc: linux-raid@vger.kernel.org, song@kernel.org, yukuai3@huawei.com,
	tomasz.majchrzak@intel.com, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] md/raid5-ppl: convert pending_flushes from atomic_t to
 refcount_t
Message-ID: <ajkVDGAdveCH_urr@stanley.mountain>
References: <ajj1yljwrUk0bZwp@stanley.mountain>
 <20260622102859.38034-1-sajal2005gupta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260622102859.38034-1-sajal2005gupta@gmail.com>

On Mon, Jun 22, 2026 at 03:58:58PM +0530, Sajal Gupta wrote:
> Hi Dan,
> 
> > Have you tested this at all because it doesn't seem at all correct to
> > me...
> 
> I have only done compile test, sorry, I forgot to mention that.
> 
> > How I imagined this would work would be:
> > patch 1: add a break statement to fix the use after free
> > patch 2: s/atomic_t/recount_t/
> 
> > The difference between atomic_t and refcount_t is that refount_t warns
> > about overflows and underflows.
> 
> I did it like this because that is the pattern mostly used in the codebase.
> Simple s/atomic_t/recount_t/ would have
> refcount_set(&io->pending_flushes, 0) in init
> and then later refcount_set(&io->pending_flushes, raid_disks) in
> ppl_do_flush, which is not the usual way. I am treating it as a proper reference
> counter rather than a mechanical type swap.
> 
> If that is too invasive, I’ll rework it into the break fix first, and do
> s/atomic_t/recount_t cleanup separately.

Heh.  Yeah...  There is not a chance I would merge a patch like this
without testing.

It also really feels like an AI patch and you're supposed to say when you
use AI to generate patches.

regards,
dan carpenter

