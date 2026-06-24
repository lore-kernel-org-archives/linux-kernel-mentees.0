Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810112609EE
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Jun 2026 04:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782276081; cv=none; b=Cxpo6jBSEVTysXpRK/OFhKacHtjsE/A4sqZAjqgQOupsq6InsbVZpWFtG9aTsULNQC1lXEJ9wgp3j9uh10AA3suXBMR6Zkt1WARGiR2HRLmmeRvfIj1Z4NgdgiiWgI1RFqUIpg3AypwW8O46AgQ2eU2B3gw0blJu86mauCYdIFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782276081; c=relaxed/simple;
	bh=HLVy3TH9ZBdUC9IImCHUkld1iGj1Bi82eoMFoRdb5ZQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=jtt0xzxOuGsyj/wfVoUk+aPguQvcjjIoM9y59utH5hMNTliMNjfSKBcPjO/m5I88Kx7bj/HKYzJSpPnR/T4H+D1WFZOt6GzmqNjkpiLu5uKmzb/i2acFH5jWaHUhBB0H6eOE/sufYim37iFD21AZX/Wh3f9fOSHjpTJu9CvHhgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=WmHu+geZ; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="WmHu+geZ"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e93f93ed01so464815a34.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Jun 2026 21:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1782276079; x=1782880879; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLVy3TH9ZBdUC9IImCHUkld1iGj1Bi82eoMFoRdb5ZQ=;
        b=WmHu+geZwmOJCJ79nL1hH+EHQY0kme5sdpzU1Z4iJAUYvpHqCVIVuUNdyI6NKeeLYi
         gwB1niRUkJlcRxD5+JrOivIX4lgWq2q3Hbem3x4ONqpV8X7SjaTva9cbhLj9KWcMcRuA
         r1fUaFO3ITMw1pVq3R4leUTIo9FjcXSjI/LVs19RUgjx1BuIV4h78A8A6THuhL67Yjl8
         d13eXhZ2H16YKHediAgc8Oay/ILee5bNsH4zw6Rm+hCAUIGh/1h0IYWbdKpLK5Xf3IpW
         W9uxoD9DJFHMUCYG2B72T1wiCPBWVMY/1+Dd1f7qDZBV6RICPKvSY58f6aiimMBye3Ii
         5Q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782276079; x=1782880879;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HLVy3TH9ZBdUC9IImCHUkld1iGj1Bi82eoMFoRdb5ZQ=;
        b=PNb/giz01PhhmAc5gyOEO8lC72silvwcfdPBA+aOQjcznzYk+ClZT8Yekw7kM7IUNi
         8lGzQpR0BezhGAXKb67SZYkJwxhXkBYa2+Dfb1Bvsh9fIrBRi4iEWHM241VYTBojomfT
         WCO522bVkSfbENR3jxu+MOVwXm+pzKQZVhndGIpVsYAaQP1fYUJYb9iuYAL1Mxv3M5HA
         m2GDe/pk2uKAlGv05zfCu065UpWG8ng+Ad/Eqf/emWjYyO7jxwrmWlMGnr+oBSqmZ5XO
         woDHvLA4aB81R7A+yw1pKPlW8Wfl/RQZq8Zf9ISDut6CFP49WWs5JdRGSzYc8c6xeFi/
         zDIg==
X-Forwarded-Encrypted: i=1; AFNElJ8e2FTrwPrRTV6gW4rxlJWxZeJLdlDRayWaVTinhMfGucOwNG9+c3DI6J+Anyi1c/dIfo8fb1aSfpAuyv3tGubYfSlDrA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0ybow7yCdNX6/26hYRZUSLG0ZByMLLqHL6LRGeu6iVB5jpkdl
	+NacVN4nLy+d37omqBEA9L6nFNPoipxc3ul0RYHicg7t0XvCd1kG7DhA+ry53jcMZLU=
X-Gm-Gg: AfdE7cny+pgnJ1aF5Mjx2vYrMbYrQ2MchmhF8U+GzIUZrZufJEShibEhXsl7OKvZSrl
	HeDJk/9kANx9aGUgxjKiQ1PyPhRkuVqbkM0mZzim8miXQbnAckF2naloWaorS95U3nO3aGH39i/
	wkjFvxrMwsAJPxG5SEW9j6LdyuaP4MS/rDvVsQGB+lm5LYmbJG3TGXSm3THt8a5H90FT52rKy0W
	SeXyvbBvh0kLeQfDuHgU2qCgJpWkIhPtVMp5SDSvKsYGGXvJhzAmUFxsSKV7xXhGrxoBeMT4N1Y
	VTIums5cjRYI95ALQh9ezYGQS7liOL4+gy9577NLTVzafO9q3/u58vkJYA2b7mN8BlwtsAyZlQm
	SlF5C2FnwntSzJPyf4u+kIVD0aMEnirXJ1iV4fJgkwX7UepdEaPY/sivx67sy6huUdFuBl3TYbh
	3F24gd9EaddoNAuw5eT0iKgz/oWBQ4obKdp9R4/7VyvjhbTs3t4D/4zLQAIDKfukEPqM+g
X-Received: by 2002:a05:6830:6508:b0:7dd:9b19:a875 with SMTP id 46e09a7af769-7e94083e3b9mr14683547a34.2.1782276079546;
        Tue, 23 Jun 2026 21:41:19 -0700 (PDT)
Received: from brighamcampbell.com ([2605:fb40:0:c09:9ca9:e0fd:b7cd:be76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e944068bb7sm10280395a34.9.2026.06.23.21.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 21:41:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 22:42:47 -0600
Message-Id: <DJH0687PNY2P.1WOW0ATJ2KZA9@brighamcampbell.com>
Subject: Re: [PATCH v2] md/raid5-ppl: fix use-after-free in ppl_do_flush()
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Sajal Gupta" <sajal2005gupta@gmail.com>, <linux-raid@vger.kernel.org>,
 <song@kernel.org>
Cc: <yukuai3@huawei.com>, <tomasz.majchrzak@intel.com>,
 <linux-kernel@vger.kernel.org>, <error27@gmail.com>,
 <skhan@linuxfoundation.org>, <me@brighamcampbell.com>,
 <linux-kernel-mentees@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260622142146.56637-1-sajal2005gupta@gmail.com>
In-Reply-To: <20260622142146.56637-1-sajal2005gupta@gmail.com>

On Mon Jun 22, 2026 at 8:06 AM MDT, Sajal Gupta wrote:
> Compile tested only.

It looks like you're on the right track, but this could use some
testing. My analysis here may be incorrect, but it looks like it should
be pretty easy to test this patch by compiling and running on a system
with a RAID5 array, PPL enabled, and no RAID journal. I expect the call
stack would look something like the following (feel free to correct me,
anyone...):

ppl_do_flush
ppl_stripe_write_finished
log_stripe_write_finished
handle_stripe
...

To be sure, you can add a tracepoint[^1] inside ppl_do_flush.

Dan was probably reluctant to make the change himself, opting to instead
submit a KTODO because the change is relatively straightforward, but
testing is a little more involved. Testing is particularly important
with respect to subsystems pertaining to the filesystem because latent
regressions could mean permanent data loss.

Cheers,
Brigham

[1]: https://docs.kernel.org/trace/tracepoints.html
