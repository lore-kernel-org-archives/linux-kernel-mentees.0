Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2FC377E83
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 17:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485568; cv=none; b=jwKu4H0FGfW4rY2ddxhhzXD91CtIDtoc8PXUesUQgqrDw8/7lIURkq3cv/3uC33dLz9AyaqzXPGjiJiEpVSyINh/VQCGOSJpjOY807IWtUz4UvQ0bQQ+Ne3s0qOk1wZ+VURRq7twOVNHE6WiWvg47H36/hyfNOBm+iN6fNFPshQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485568; c=relaxed/simple;
	bh=c8iyZOUFGOMLU5rvPBd1mGZsPw8GXHa0miKrdp2Vaiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jxDaLrHm50jGDD9noOYb/X0Qpc3Dn3BHiMcii2+lo6rdEe74DLANm4afznSmpcDfaP2tn6XoC7fhgxtO012LRvDk77T2VgqxGvcFMWo5Sv2zDOa2MZkS6nzhxTDPy9d+Ib9FQ7CklK8j47caOGEdjQaErf8wGCtuCYLl5kTlBYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRpfQ6qy; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRpfQ6qy"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81CF040074
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 17:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0sTt8Dk1-r_g for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Nov 2025 17:06:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A106A40E5F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A106A40E5F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aRpfQ6qy
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A106A40E5F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 17:06:05 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47797676c62so3288565e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 09:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763485563; x=1764090363; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h4LKFLLmkHOO2YyB1FuGp5QuRpPLnDUvWV5UXKIiXfk=;
        b=aRpfQ6qyDl7i5M0l6/GO8+ElNqXHZO0Iri9p9eCThYJK0U0PDu1LKaSh2+qloMfKl1
         L4ZldPORSFoENabGWfw/X1lGlLgy9535NAa2QiBm6tVc6L2sdEuFP9l0DPHJ84iR+Ojn
         FDXiONQ5WI4BOBRojCIRdOqQ+Ax5TaV24SGmkBXiNkWp11aq1yzlVuw3Ko8TXYKq3j8n
         YhPqCU/Y6N7I4tD9+Pgwe0gsdT3iPEgO0eDz2O/reVuldpMpfIQ/79fYJP8HUzpwyhqy
         X3RH/8/3+1E2Z2qQMKXz+tY6ZDYg0gG3J0Vx2WgUT7XNNaP0OXwCwh3b3poddGsNw1tI
         G2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763485563; x=1764090363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4LKFLLmkHOO2YyB1FuGp5QuRpPLnDUvWV5UXKIiXfk=;
        b=mcr5zE2RELdVRRHoccU4LTdjm3b75WyaCd5vd1amDcNz3Oq0jIjtuq1ek08bvyoDel
         2grG9WJZAQNNLBaxgfI0UY7kTcbe4OpP16OwEIbcrQNRsu7h1g1GsHUUVmEvvzD2SkQh
         xBVoyJE6BVA/h8TfdOw4Y96Y6R8U1JTGw240z35NC+08bt15gyFbImqBnxM4msAX2tbG
         fPSlEycuzju4FRk2GN3/Q3oXSo8xbi459ZeYlGLJf5Ga2wBwm61p4M/G82mo7w6Tyokb
         Hrukc6SqCNYHJdTe25oPXbGZaRU4+eWWMG7zwWDoUBabjrSN/V9tCU7Sybyox6ZcQ4NO
         uElg==
X-Forwarded-Encrypted: i=1; AJvYcCUmZa6Sqg0Bhn0OMs9uqX9r443fwN247x8QFaj00cNECn69Ih6sRj+K0oPOceGTqAcD60HTt1//7jERiRb9KYnE5sbcSA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyI1LLvkEYjffUme9TxCcH06xnOy7kraJAGkTI+a5yV8SidhRmD
	AilijcCjiOvsGsrhRRIZf3Jp/F5I5uN3Jd/JfBpfq/KkcrgHXnYHvK/7
X-Gm-Gg: ASbGncv5O8D9yVSeoiwuCoehUekdF7kJAzA630OVrf9OfUkY1ch1teZyWIyAKPLPRC4
	cXc8AQXr7gOrnQth3NrXz2qcSQZI4TEL7iBdLq7UHsWRDod2O6Wf1IuHPlcu4M6mIaDBuhFw5gA
	GeaB2rXremAWkGaT2TyuedHxBkzxR6xDCVgbCF5Y3Y70Ema97XKvhqY8qu2JAOuNAtNA+fE12X/
	Ft9rHtzyGUOWp9YepHqEVySfwA5j27A32eKpCg9RYXyzUDo4XRfv88BPJpsQkcQPkEX40Imf0WG
	5mqexazS7hVU9skoVPmC51FP8Tfxz4B5ZevvdhsjRBQ1d3Xmr0AHFMMpk5Lk4JaqrGs24mzYoLz
	r5beBYw+uNwxmJJKFIgHZmaeC1abqA7rZnDwc1PR/+6YJpdS7k4wDPyvWZP3bYw7Sj1ryQ8Fy+R
	CZbDtodte8IsKBMhkLSKAAWvk0rYULo5RwHGgJvSN6
X-Google-Smtp-Source: AGHT+IEry1hEqU9c+Efos00n6PiUk5jPDLkd+/hqr8m0S/JkYYA1s82T4mTqsPxXSNj4jy8GNkox2A==
X-Received: by 2002:a05:600c:1d26:b0:477:9fd6:7a53 with SMTP id 5b1f17b1804b1-477a9bf23f8mr19857245e9.2.1763485563223;
        Tue, 18 Nov 2025 09:06:03 -0800 (PST)
Received: from [192.168.1.105] ([165.50.73.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm21111345e9.8.2025.11.18.09.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 09:06:02 -0800 (PST)
Message-ID: <86897b3b-23b7-400a-b8d6-4169e78bf5d9@gmail.com>
Date: Tue, 18 Nov 2025 19:05:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/super: fix memory leak of s_fs_info on
 setup_bdev_super failure
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: brauner@kernel.org, jack@suse.cz,
 syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com, frank.li@vivo.com,
 glaubitz@physik.fu-berlin.de, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, slava@dubeyko.com,
 syzkaller-bugs@googlegroups.com, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251114165255.101361-1-mehdi.benhadjkhelifa@gmail.com>
 <20251118145957.GD2441659@ZenIV>
 <6c482108-78b8-4e09-814a-67820a5c021e@gmail.com>
 <20251118163509.GE2441659@ZenIV> <20251118165553.GF2441659@ZenIV>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <20251118165553.GF2441659@ZenIV>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 5:55 PM, Al Viro wrote:
> On Tue, Nov 18, 2025 at 04:35:09PM +0000, Al Viro wrote:
> 


>> For HFS I would expect that hfs_fill_super() would call hfs_mdb_put(sb)
>> on all failures and have it called from subsequent ->put_super() if
>> we succeed and later unmount the filesystem.  That seems to be where
>> ->s_fs_info is taken out of superblock and freed.
>>
>> What do you observe getting leaked and in which case does that happen?
Sorry for my other late reply. My thunderbird client had some issues and 
got delayed and seperated emails somehow...
> 
> AFAICS, the problem is with aca740cecbe5 "fs: open block device after superblock
> creation" where you get a failure exit stuck between getting a new superblock
> from sget_fc() and calling fill_super().
> 

Yes this is what I mentionned in my earlier mail.(not the commit causing 
the issue though).
> That is where the gap has been introduced.  I see two possible solutions:
> one is to have failure of setup_bdev_super() (and only it) steal ->s_fs_info
> back, on the theory that filesystem didn't have a chance to do anything
> yet.  Another is to move the call of hfs_mdb_put() from failure exits of
> hfs_fill_super() *and* from hfs_put_super() into hfs_kill_sb(), that
> would do that:
> 
> 	generic_shutdown_super(sb);
> 	hfs_mdb_put(sb);
> 	if (sb->s_bdev) {
> 		sync_blockdev(sb->s_bdev);
> 		bdev_fput(sb->s_bdev_file);
> 	}

I will do the second approach, test it send it for review shortly.

Best regards,
Mehdi Ben Hadj Khelifa



