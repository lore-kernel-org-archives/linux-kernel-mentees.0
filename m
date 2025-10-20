Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF78C1E9919
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Oct 2025 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760955784; cv=none; b=pr96TsVetvnTeUvhFvUSYoUslXlnleVbgLY007zaw0dY+1FlIGd3c9BUPoohku46KvTNYd/jwNZhz2+Ql7Zkx4AVw2wNvbnWMI/ZSlX0ZGsznGoWDIOQ2IW/3cLAtyjZt4xao9CAI49ebqFr5BkL8AxLpRaWqiCahduog2u3MFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760955784; c=relaxed/simple;
	bh=Y/Of83zNnX6sLmH5GHkmtmLz/GMJGrrvbX//+5h9WSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgWQHUh/jmWL+kAJY0jizIJiv3Hu0LhBTwMdAUAZUUg6cfHXFZCV3o/ys1RFddFFmZomwaGI0bwuFJDbWcQJXJsb90l4ufEm91QAAbRLwO+1SwIb31Wrug1p4A+V0dNb+W41N7ZhjsH1iI0AENqyIYdEDrRjNfDgOTbYArOeRd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6EAYidg; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6EAYidg"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-42e2c336adcso18559885ab.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Oct 2025 03:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760955781; x=1761560581; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwVo13kZhRZYVn6fdjYldZCTWh9uLDhB/G1K2cn+K/o=;
        b=I6EAYidgdtTkcceIAp6hYf2IpZ8kdeZfP8PcHQKsy4SM1tMou3RCIEqRYVMwH14LdD
         lKRJvoGOg44VgvrJsq3BIWvGnDtp0oWnNMcLbqOfPzJTkwxle+15rlhrDucw9nM2B5Ou
         sT4QImZ29Wxz7vu8tKH6w2Er3euEBjW+di6CIcnuYASpL02QR+ZbRfDAAC4XG3xyuant
         J4ReTqb/iwiiIfDi4mKoxJ23mIzh7WxozvuRY2pnJhDXqW5cD+ETZ38bvsC2eqGOaLj7
         IEMyUbGv/11jcTcoKVD9DqcgJuon/WAKSzbazwdRki24DtnIrncUtg0CbvqqmeUmKd8O
         0Y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760955781; x=1761560581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wwVo13kZhRZYVn6fdjYldZCTWh9uLDhB/G1K2cn+K/o=;
        b=Wn0mkZ279oUcorA/ptciKtZQxi9cupqnCkMmD9NIEhbPReKGMeLRmZIUqgya+VY3di
         5LSwL4anwo1weV7SPjZLUpzNBuHaMgAM6s2wPUXp592tUYUCnENPjvNq8JTtSBf9Yi8g
         GBnKsRs06n/J35JybnGIGDm5y5USNnWw+icXkU+fklePlnO0azgkd3XMYgZQFO600oUt
         7ZKoo8+csRpxIa4kTtIZVlkR+rWF2O7RoHbSZFDGlXzF1urz+kdJd4ttvZGgCkO5Czh8
         mEWP8WxGLysxubdairInOMzfyPvD+pYfq/vA50F46gA1ZLFuo+vT31HaWa1JYRmyJndP
         mhXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQs1Ny5rbj3XBu0Xphyl9lOGCO2uJEutmAcQ6FEVjaTsIsL+fOIZKZZIj3gwZYu2WH16STDd0AoSmqHc1RV9+s8qxRww==@lists.linux.dev
X-Gm-Message-State: AOJu0YznEQfWSMnHfVnFlVukJ9JpNTzRFmXte9qhkw3cNCiDHUDigvx7
	FPkq+i3oRGv+1jWZn2pWpFVIKz2oEYkRWLqhQyA99Ac5D0iu9NJ+sSn8
X-Gm-Gg: ASbGnctpZrdN+Q1KhWN8EAy0FJA/tweV1HgC31Dw8N/SluzjRMCtTznF+GUjIND7RRp
	WwYP83olvIbwMz3FCCc6mexPEYbOKshj+bgMtNuGrvcRYbCWBYKWgvWy9/6DaeP2ekVOjWvjxmq
	NjMn8J7eNl/fwxhSq/BeGzrSd9zch4AUojDs3nzR6AoHSFwHR1a7hJw2bEpJOoMRPWqpuVw5tqZ
	SqPxn5SiRL/QmWlZ9iskYM7iJh5LFKYjrzsdcIC4/39+w/kO/ta/lnTJt4pI95zNEMJAzhAyw2X
	wI5N6pmXrbSi20grdrbcBi+rWFJVOQsegjPucSS7Xm2PxoX81zAMAa/jp0oX6E9KS0qAQ1WkZ6M
	UyJPEXmJwPa9fvVGWlRlzfO3dMyu/OUofmlkh5VmWJAACLGWmnLnlS4ZCLI0p0YfGhJBRsYS9kd
	W7SuKG/zky+r/Ffxhc2dMPC8YlbgrtwzX+4t45cCCxrNagt5IR3Mi7PF1WCEEg6iLzsOW6
X-Google-Smtp-Source: AGHT+IG4dp/N0dV5mHcutfGgLi7WUo9KkOeCCIQt4U+ykxHYiQAKOUA3QFXQGElCS92gu8u84w17IQ==
X-Received: by 2002:a05:6e02:2197:b0:42f:87c1:cc3f with SMTP id e9e14a558f8ab-430c526b099mr184393265ab.18.1760955781036;
        Mon, 20 Oct 2025 03:23:01 -0700 (PDT)
Received: from [192.168.88.138] (108-75-189-46.lightspeed.wchtks.sbcglobal.net. [108.75.189.46])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-430d071ebccsm28529785ab.17.2025.10.20.03.22.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 03:23:00 -0700 (PDT)
Message-ID: <5e29b2ef-086a-406f-ba3b-f0b7a09617bb@gmail.com>
Date: Mon, 20 Oct 2025 05:22:59 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/amd: Check whether secure display TA loaded
 successfully
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org
References: <20251018165653.1939869-1-adrian.ytw@gmail.com>
 <2025102014-hummus-handgun-d228@gregkh>
Content-Language: en-US
From: Adrian Yip <adrian.ytw@gmail.com>
In-Reply-To: <2025102014-hummus-handgun-d228@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/2025 4:06 AM, Greg KH wrote:
> On Sat, Oct 18, 2025 at 11:56:40AM -0500, Adrian Yip wrote:
>> Hi everyone,
>>
>> This is a patch series of backports from a upstream commit:
>>
>>      c760bcda8357 ("drm/amd: Check whether secure display TA loaded successfully")
>>
>> to the following stable kernel trees:
>>    * 6.17.y
>>    * 6.12.y
>>    * 6.6.y
>>    * 6.1.y
>>
>> Each patch applied without conflicts.
>>
>> Compiling tests will be done for patches as I send them in.
>> I have not tested backports personally, but Shuah khan has Kindly offered
>>    to test them.
>>
>> This is my first patch, please do let me know if there are any corrections
>>    or criticisms, I will take them to heart.
> 
> Meta-comment, do not send a "patch series" that can not all be applied
> to the same tree.  When applying a series of patches (1-4 as sent here),
> that implies that all 4 go to the same place.  That's not the case here,
> so I need to pick out the patches individually some how, and apply patch
> 1 to one tree, 2 to another, and so on.  It looks a bit odd to apply
> patch 4/4 to only one tree, right?
> 
> I've picked these apart this time, but next time, just send 4 patches
> separately, not as a series, as you can see others do on the stable
> list, and all will be fine.
> 
> thanks,
> 
> greg k-h

Thank you Greg, I appreciate your time and comments. I will be applying 
your feedback to future patches, and the explanation makes perfect 
sense. Sorry for the inconvenience.

There may also be some confusion with me saying Shuah offering to test 
them. For some context, Shuah told me about this fix after she noticed 
it on her machine and gave me the opportunity to make the patch. The 
offer to test them was given to me along with it, but I don't believe 
the tests were done on each of the stable trees yet.

I'm writing to make sure these patches are added responsibly.
Feel free to ignore if this isn't a problem. Thank you again.

Respectfully,

Adrian Yip
