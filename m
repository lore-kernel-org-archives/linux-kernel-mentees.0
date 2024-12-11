Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D041BD9C1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 04:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733892478; cv=none; b=F55G7px/E44Rx31LWkbL3pPmB68l5M2nIJMFp2L1ClBIao5ebB6k8MzjqbjN/9VzihIMza/HbMDy7rdZi7DBxgEX/8ohb0ZJ1qU1l2jnKuR0Ue11iDzTbBJ91ORT2OmWStzKPbv/LWyXNW0JCGW9kTrBsIVMA6mkrxvuMH5NwTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733892478; c=relaxed/simple;
	bh=uHE8siFyh14HkR7zEWr+RzX6wEmDLIqqQjY4sJZKZ5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnKAVnVgBdNijJja024CXq71SXnqwCplVrZPk7gAHdB2tWEDVZBFozkQudAn4IrRsH7JOIUVhvV+h4AKbu8ROi/8ak6CMqytt34qjrefVCjGifVoMR5UVA13JivPd89+11LYI/HIFiSI/P92CuhvMj4OEJbIc5FnXP96/FNcYAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fu0D5zy7; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fu0D5zy7"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC88E400F2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 04:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ekHZb9Pv2l8q for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Dec 2024 04:47:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D906640ECE
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D906640ECE
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fu0D5zy7
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D906640ECE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 04:47:55 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6efa1e49ef0so64277247b3.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 10 Dec 2024 20:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733892474; x=1734497274; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Otzfy2Fb7dTAUP4VzNQlaGCzwGYbYIGIagEoJ0T4F2I=;
        b=Fu0D5zy7/e3QOitifVWFJUKFKuyI8JSkakEafdvMphInfQaY3sWQxKLaaLiCAiOp2i
         mlSDAT8ucl7kh3NHffAplpb1jy5UFTfQxBrwL2ZAcH/co0b40YBRqG52l3P5OPBhbJsv
         Vl8EpY3cvxELnJEfmbt3+pbNkOs7lX9wxXJtt49LvmOQq5wATkz4E58tZtY9ex2QeTYo
         FI3BHrr2G6PChw0Sip2BF3AdPoDwN+5UvOHx666ZtqBB9kvmlEiXgDclksq7qBQZ1JlU
         KceeWELYIE7OPw/LW82+6x11o6hJ8U8no+/Il8DntiibqpwjASvHIhed7E0RDwU+dpUj
         h/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733892474; x=1734497274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Otzfy2Fb7dTAUP4VzNQlaGCzwGYbYIGIagEoJ0T4F2I=;
        b=Qt0GOnMmHxRgnkcW/3f2sk6dU9cMGpWRY3FCVFuuT/m4Ia9nGIjiYeYwIbk6mwtZOk
         GoxFajcZ6CooVS/zWkf01SYnMqV5bydlpHo5+uWEuNDg5J8XIwb5GoXsWGFGI56Cj8tv
         Wg6LW4GGRGBPfEWueHcT+UdkaZp6cqKn9rok8WiSz9t28p5lIJpEffxCv4l6E2Mz7u0a
         +jrDOMyJAjKxE75RYeqO/bTsUCk5U+nws6zM3LD6Iqwv7q2H+99pXwB3DpnlHf4iZ6Md
         B/EkTCXtZPLCUGdCDvy4QHKxt+MVN03uUrwivfvhhe7cDkQ/RyJfT6XapTULvoDHpFPW
         byQA==
X-Forwarded-Encrypted: i=1; AJvYcCVsRk4Ly9rgCfMyPH9YtqLOoSI4FHIeNASVIuim1GAEv0AWauUj/y8LpzBgRmuvwM3DERFscAF4Nprw6ky55CaLQPZ0NA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzo/HSZBZnXCzjNaAE4Dbz1qqVbbvOJsI9TzvPQ5vt4bR1UUowy
	snvs7dI29eriVfA98ezuQi4PqsuFuP9WCpzbT4bqMUKO3ri9B790
X-Gm-Gg: ASbGnctB+Rh00QyZrQ6NvfI6QJyF/NyeJQdtpla7NO29mUzBU3s+nZ745dxhu5RHNt+
	yoL7k+03crjyy6Qmrj9H/HfBFcyWa0sOpu1NhLT3hqDGMRyrW2q4pBp2wzDAQ3dSymiyQcMAM1g
	liKzWJjjqt7wwiOYJUoI9beVsiUQkK+baVwGyqdg3YKtGC6DOKvOFozRuTg6apz2zgLpbzJQw3r
	EYurmM3LkU1C3+0tcrvjRRi32Qdxi9onL3FXfGyZuy/bI2NxTMRZvfDXpDMU9oUR6JwlRUOI/V3
	twIllDIgYGkZN1YpoxW7KV13lorODxMCSLn6O0s=
X-Google-Smtp-Source: AGHT+IFO5egOIMeN8mVFlXAGU43fYYzh+evpktzZVHTnhqWN5Wtu+fY6TuYiZYEvzfI5jqap6VJksQ==
X-Received: by 2002:a05:690c:7446:b0:6ef:e390:1d4a with SMTP id 00721157ae682-6f147fe14d9mr16515447b3.11.1733892474455;
        Tue, 10 Dec 2024 20:47:54 -0800 (PST)
Received: from granite.localdomain (syn-142-197-128-048.res.spectrum.com. [142.197.128.48])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f14cea6fefsm682047b3.111.2024.12.10.20.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 20:47:53 -0800 (PST)
Date: Tue, 10 Dec 2024 23:47:51 -0500
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: davidgow@google.com, Andrew Morton <akpm@linux-foundation.org>,
	andriy.shevchenko@linux.intel.com, u.kleine-koenig@baylibre.com,
	skhan@linuxfoundation.org, rbm@suse.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH v4] lib/math: Add int_sqrt test suite
Message-ID: <Z1kZdw3VybM9zN3+@granite.localdomain>
References: <20241210172822.97683-1-luis.hernandez093@gmail.com>
 <9op57qr3-p152-6ns7-52n6-35599801rq22@syhkavp.arg>
 <Z1kKlhUceHxZrMeS@x13>
 <n9o7rp0q-3894-544p-7s36-693qo49p9no2@syhkavp.arg>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n9o7rp0q-3894-544p-7s36-693qo49p9no2@syhkavp.arg>

On Tue, Dec 10, 2024 at 10:58:02PM -0500, Nicolas Pitre wrote:

> And for such kind of test, more values to test is not a bad thing. So 
> I'd suggest keeping { 4294967295, 65535 ] as well in the set as this 
> represents a nice 
> edge case.
> 
> It wouldn't hurt adding the entire set from 0 to 9 as well. Many 
> different edge cases in that range.

I see, agreed, thank you for your suggestions. I'll go ahead and carry
out the following changes:
1. Replace the ULONG_MAX test case with the aforementioned { 2147483648,
46340, "large input"} case
2. Add the { 4294967295, 65535 } edge case
3. Add missing cases between 0 - 9
4. Add a couple more cases 

The updated test cases would be as follows:
{ 0, 0, "edge case: square root of 0" },
{ 1, 1, "perfect square: square root of 1" },
{ 2, 1, "non-perfect square: square root of 2" },
{ 3, 1, "non-perfect square: sqaure root of 3" },
{ 4, 2, "perfect square: square root of 4" },
{ 5, 2, "non-perfect square: square  root of 5" },
{ 6, 2, "non-perfect square: square root of 6" },
{ 7, 2, "non-perfect square: square root of 7" },
{ 8, 2, "non-perfect square: square root of 8" },
{ 9, 3, "perfect square: square root of 9" },
{ 16, 4, "perfect square: square root of 16" },
{ 81, 9, "perfect square: square root of 81" },
{ 256, 16, "perfect square: square root of 256" },
{ 2147483648, 46340, "large input: square root of 2147483648" },
{ 4294967295, 65535, "edge case: ULONG_MAX for 32-bit" },

I'll incorporate these changes and submit a new revision of this patch.
Please let me know if there's anything else you'd like me to address.

Thanks again for your guidance,

Felipe
