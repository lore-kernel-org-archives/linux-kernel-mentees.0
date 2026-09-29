Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661354E2F03
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 21:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718266; cv=none; b=MohBp4BpgRYsr1+I8gtTAR/TRLQr7XoXKptr47zzUR2CXPM/DW38SSeV1/Hew+TnXbMS9l9AvLur53FMpWTMPI6aaQVsfsDq7k178+83I0ChTKZk+PqLJDyHdupF5CeKRRQAfccNyYcCeHhGHfLPR4Y437DHHw3kqCWhwF/RPRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718266; c=relaxed/simple;
	bh=sSS5ujNqwDF2ukOfHcgyrFNo6NxMTwMpa3kXviLIz/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElNG19BuBZf/QWWjRZcZbtW8dsHaTY1Zn4MK/Tw2Y5DlXybBo6mdHcKJuDxB5b7lIBYO2NSbgCqkxsb0iB35nCTmGEaKiTcBsKg5STeZraegG43KnaFyj866WIlghqGbKCFN3rUbvdfGS+SvDAc21ML+MmIgINb+phaj4RWAxkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=kEBkUOrR; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="kEBkUOrR"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0eeda3e03so1733576a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 14:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790718257; x=1791323057; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9q+E3Xh65cY9+ofmYDsNL60Gz/7NdFCbD28qz8ceGUE=;
        b=kEBkUOrRReYeLgkvtZwInOZ9U5Fc1g3MWZ8YGv73mEuZTvfg7bM9bJoy8d6R0U1m+B
         KJe8HdUXQzcTP/XLO8CSix2V+j6zN/YjwrIRo6JfPMABHLv1EgQ4/b8vZP15GvLVvdEs
         QAehvA2V0snWct7QtXawsfOYokk92+h/OFTbvRAZSeKAX/RRtnYjFLqSwotHTHsaQzfm
         eZbu5Wy6Fboa4N74qQ9GvyAqgPKED8TeQnG8xgw0cvkH2qEQOYrEdpWnDvAPfHJaHO7C
         Im0he1bBEpJawf9Krmrhn67SgWa1LuhrgqXxLJT1RtG741glaSDnOwvC/fyzxllmEPJo
         14pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718257; x=1791323057;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9q+E3Xh65cY9+ofmYDsNL60Gz/7NdFCbD28qz8ceGUE=;
        b=a5TBKguMtYySvKD9iZIoDjZ979YuCobUnV2W6UVB2ua9jnWg8x8dWsdv7eJqm+JQ1f
         PDXNEuWly1uhvQtwwGaEopgnC2LV7Xoc8gnq/ILX1IuBxfI8ZsAJhu+7ucLwF6SfVclZ
         SFTnD5AD5WEJzcb7h77v0QAOGi1j+IpynV5nUdcseUDU7sYe+Kp3SXZyt8W9R50aWEXC
         vbKNMtzyq3d+pxS5vVp6T/iu8+3XEpe+j3hu3F5FrYZRFrao8IMqsxcQdHodIf22KVfb
         waiaEbEzNH1nuo0cL/KwNvFQxcQ/D0I2oTi9UTgGH8Xk3rNoNukwd4SGwu2TO5o1HEhX
         s5wg==
X-Forwarded-Encrypted: i=1; AKwUvBzcpNhrRPYY5IL2+n10dI1Hf/voezxXK7XrhxaP+4gxZAHc+0V+EYQhuJgEjBfvXqqNsX1LlJq9h7Xsjmlgjaffc4R1CA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLZErk/2/8u2Gz+Uuu6Lb2NGCDXaaY1vmwxWiFIiKw+nE6v2mi+
	A3K3boru3uSErlwfpoE+iV0SuTdpwSbRDaIMcFgsSO5uaoj45CjN2YduzKQfrPyWH7c=
X-Gm-Gg: AYBFou3LkHczoQOsYTxfQDLHp8xkwjKVq3kYXY8zK69wErx/S1AfA+0xraf05OjOF26
	vesV7bbByaGRK31n59j/n6UNAxpiQu14mb98qVJBvTOo+ojE2ai5j/OHM7utwTza1xcjyLOZ2RH
	sw1YtJ7sejIPYtJE7TTf/JicMVm3eObeQGg8w1PwnqY2cO82afwweylTOq9C5x4gyw7BhD1MYsn
	Hznv6y7jblWty4LQ3Bc3v9hFeVHVUf9A2OQsA9pewv9igTWuLpRvQE0KVwuElspTlYCYPrmsFRW
	TyNGmJegy2KPo3xR4lywVsF1i0o7ujjowv5qEuc7oEDqXEBfAvfaWVQErMJA6THJZNpz89rOIIr
	69Wp+yKLDx6CT3DiYCRT6maP90NEKoh50DY3lZiWFW8NDlZeWaowL3hKQErigY3hF+P0SwDrYbs
	JnrEBpPH1yC0XLmPcAwXH29tQiB97TBXe2EOLzO22fgviixsbNDWfsJa/MrMOPib8qI7MIowO6E
	wX+hJtIWwHruCaeilK0GOFv
X-Received: by 2002:a17:90b:5109:b0:3a4:b8f3:8192 with SMTP id 98e67ed59e1d1-3a4bfeddacemr290081a91.52.1790718257035;
        Tue, 29 Sep 2026 14:44:17 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4c::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4c6142209sm74299a91.0.2026.09.29.14.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:44:15 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:44:14 -0700
From: Joe Damato <joe@dama.to>
To: Ayush Yaduvanshi <ayush37735@gmail.com>
Cc: Edward Cree <ecree.xilinx@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-net-drivers@amd.com, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH net-next] sfc: siena: fix kernel-doc description for
 efx_ptp_timeset
Message-ID: <arwxLnscbs05f84x@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Ayush Yaduvanshi <ayush37735@gmail.com>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-net-drivers@amd.com, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev
References: <20260929100625.50380-1-ayush37735@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929100625.50380-1-ayush37735@gmail.com>

On Tue, Sep 29, 2026 at 03:36:24PM +0530, Ayush Yaduvanshi wrote:
> Remove excess @valid struct member description from
> 
> efx_ptp_timeset.
> 
> Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
> ---
>  drivers/net/ethernet/sfc/siena/ptp.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Joe Damato <joe@dama.to>
