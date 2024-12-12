Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC3520B1E5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Dec 2024 07:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733987902; cv=none; b=TK/hyRXXmuK+/LuegmDm2Uo0S02oDbeKZwLml7AeocD039vF2zJe9D9BpENOH1pls3L18hc9TLNiWw50xkMUDQkrtki8xkpyNsAUT048YV40dkjpPuxB3CcsZMUS6ixyQVk2+MDmC6/EPNIcezqweuzyQgBsJ01YVEZbbDEid8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733987902; c=relaxed/simple;
	bh=YC83PvobOTU6cIRoe0xXrvh9Ld0bWXMQPLb/UNtmXFI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eSDTHS5e5iFeyKd6muEA85yy5ciInC0bqMKC3jqRAk6MaAjn5dudNUKPA7zPE1MNXudugIXUdG2APXPzrs3IOyaoi3yOd9fPEap//KBaXT4/HPxsnTWqAP4hHzU/N/TRO2GDH8MpFK+5oRjrd6wbdI7wKe4ii2XNCniH85skcus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ox0la8m/; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ox0la8m/"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BC13811C9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Dec 2024 07:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJuYys5CdZTP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2024 07:18:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C12C281156
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C12C281156
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=ox0la8m/
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C12C281156
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Dec 2024 07:18:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 72163A425B6;
	Thu, 12 Dec 2024 07:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0820AC4CECE;
	Thu, 12 Dec 2024 07:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1733987897;
	bh=YC83PvobOTU6cIRoe0xXrvh9Ld0bWXMQPLb/UNtmXFI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ox0la8m/OCbum+U9rQiZzEETcQCknipsmScqa6V6u2JydWtbv/XrHmACIEu1KApEG
	 En+z7WZD+72UI+QRhEtim2GmexTyqNdJFODeDHhZH/XFu2zpfwbXItDIKJOpY+vYRW
	 ZaagrOugRFI3YNGb+1uPfO2DlxjRHwKaVbL19Glk=
Date: Wed, 11 Dec 2024 23:18:16 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: davidgow@google.com, npitre@baylibre.com, stern@rowland.harvard.edu,
 u.kleine-koenig@baylibre.com, skhan@linuxfoundation.org,
 andriy.shevchenko@linux.intel.com, rbm@suse.com,
 linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] lib/math: Add int_sqrt test suite
Message-Id: <20241211231816.9857d14e07251165e247eb51@linux-foundation.org>
In-Reply-To: <20241212021259.20591-1-luis.hernandez093@gmail.com>
References: <20241212021259.20591-1-luis.hernandez093@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Dec 2024 21:12:58 -0500 Luis Felipe Hernandez <luis.hernandez093@gmail.com> wrote:

> Adds test suite for integer based square root function.
> 
> The test suite is designed to verify the correctness of the int_sqrt()
> math library function.
> 

my x86_64 allmodconfig build says

  AR      built-in.a
  AR      vmlinux.a
error: the following would cause module name conflict:
  lib/math/tests/int_pow_kunit.ko
  lib/math/tests/int_pow_kunit.ko
make[1]: *** [/usr/src/25/Makefile:1925: modules_check] Error 1

