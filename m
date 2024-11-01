Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8EC158DD0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  1 Nov 2024 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730469114; cv=none; b=Q3pG1zTZL83/OGfJBHNaCL36oG8wlrploAI5s86ZmOBkIzcFtTOp5hfPjY5AedDje1z/Q0OsACJPd3yKOOal3Ue0lSw7qqdpP930IFzcXKu3kgXtuGfVqJbENG+N2FMx/m2g4T1Y4FGXqIhV0SY2Y9xNrJ+3QbdRdmMfe+DPyHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730469114; c=relaxed/simple;
	bh=76YUtV5jzmR+Ks9ik16mVnMvTU3YFKXpz4tz/1lYLbE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=MZ4PVPUmRzaSSekFcgBrW6lgAbWRnFLSK+sVzV5sCg2qNIvobvJfCNziNax1DcEuEITWzGvxkpmBwLS//+qjzABCBYVl3nQDEZ83dx+X4NI+q90oXQnAOQaTb7Yr6xT1+cJnOhRm+Bmpfo3v6Jf1oE3cEoYahXwH3ALp7o7PZRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=rdnXJNvv; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="rdnXJNvv"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EB224048F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  1 Nov 2024 13:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8YFesxBpouX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Nov 2024 13:51:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F5A84045C
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F5A84045C
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=rdnXJNvv
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3F5A84045C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  1 Nov 2024 13:51:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF5525CB0D4;
	Fri,  1 Nov 2024 02:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D50CC4CEC3;
	Fri,  1 Nov 2024 02:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1730428095;
	bh=76YUtV5jzmR+Ks9ik16mVnMvTU3YFKXpz4tz/1lYLbE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rdnXJNvvAnC9WbaX44ODlWpiE3xvkNNm2OWiiTi0E9pB5KfWk5RFDpeHUmpoL4esk
	 yHlBFhl+ien6XZIyndz7LTS6Dn73QNQ0Z1aTcpcCt4at1PWwGX58dUfEePCIRQIaTX
	 S3lrArIxEVsRXEVbY3l+66vf8UKYqW/8OkQL6zP8=
Date: Thu, 31 Oct 2024 19:28:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
 brendan.higgins@linux.dev, davidgow@google.com,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 ricardo@marliere.net, linux-kernel-mentees@lists.linuxfoundation.org,
 andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v3] lib/math: Add int_sqrt test suite
Message-Id: <20241031192814.736a2a7ac2ffed72f8e4b142@linux-foundation.org>
In-Reply-To: <388a8b6c-1acf-413c-bbf4-3b23156117f8@linuxfoundation.org>
References: <20241030134355.14294-1-luis.hernandez093@gmail.com>
	<c213dbcb-35de-4afd-9d4b-f42f6a9e3de6@linuxfoundation.org>
	<20241031173941.3487ccbfd7421d81d9b0cb97@linux-foundation.org>
	<388a8b6c-1acf-413c-bbf4-3b23156117f8@linuxfoundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 31 Oct 2024 20:25:56 -0600 Shuah Khan <skhan@linuxfoundation.org> wrote:

> > What's this change about?  It seems somewhat unrelated to adding a
> > single test.  I mean, there's an unrelated test listed in
> > lib/math/tests/Makefile so what change does this patch have upon that
> > one?
> > 
> 
> I think this is a new test. I can take this for 6.13-rc1
> 
> I thought the conflicts might persist in case you have any 6.13 material
> already in linux-next. Doesn't look like it if you could apply to 6.12-rc5
> 
> Sorry for the confusion.  I can take this for 6.13-rc1

No probs, I'll drop the mm.git copy tomorrow.
