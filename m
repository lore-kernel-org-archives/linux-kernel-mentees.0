Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E67335C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 10:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761475502; cv=none; b=Vqj5YzRsYs6m71GW2LirKU2lkAKcM0vJp2M6J3bpaM6/Ifwo81V8PRVKLtXZWfbBHi0iQmlxH1g35HrjWH7KPw9sgZ/MxBxnAM1I3QDsC3aWbpoauTZZGZ8u9g49cdP5MWzX331ZDtt4G+9Hm52CuPDN3YAHN0xCT/A/7TYEluo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761475502; c=relaxed/simple;
	bh=pSHBeKw/R6rKCZNSguZUfNIAjlS57FRnL+lgEqm4MD8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YQSwSc9Y/QLhZJulUxjUCbfiF6lHqspOdgyu91W5NWDgi2vb8mO+Zn6qeLWm36zheYVrk8djGn3WG494ztH6dFzNh6EuL9IVf18EwxpjFSFX29Jgrjr1axl4YzHeXejZFOk4iefm1mBxo/wat68JsTnjoCyQyiNLNy2BmbWVbTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 835E040C42
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 10:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Zkc-VERAGGd for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Oct 2025 10:44:59 +0000 (UTC)
X-Greylist: delayed 37172 seconds by postgrey-1.37 at util1.osuosl.org; Sun, 26 Oct 2025 10:44:59 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 82FBC4062B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82FBC4062B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:470:ea4a:1:5054:ff:fec7:86e4; helo=smtp.gentoo.org; envelope-from=sam@gentoo.org; receiver=<UNKNOWN> 
Received: from smtp.gentoo.org (smtp.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 82FBC4062B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 10:44:59 +0000 (UTC)
Received: from mop.sam.mop (2.8.3.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::382])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DACFF341438;
	Sun, 26 Oct 2025 10:44:53 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Nirbhay Sharma <nirbhay.lkd@gmail.com>
Cc: Kees Cook <kees@kernel.org>,  Shuah Khan <shuah@kernel.org>,  Andy
 Lutomirski <luto@amacapital.net>,  Will Drewry <wad@chromium.org>,  Nathan
 Chancellor <nathan@kernel.org>,  Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>,  Bill Wendling <morbo@google.com>,
  Justin Stitt <justinstitt@google.com>,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  bpf@vger.kernel.org,
  llvm@lists.linux.dev,  khalid@kernel.org,  david.hunter.linux@gmail.com,
  linux-kernel-mentees@lists.linuxfoundation.org,  Jiri Olsa
 <olsajiri@gmail.com>
Subject: Re: [PATCH v2] selftests/seccomp: fix pointer type mismatch in
 UPROBE test
In-Reply-To: <20251026091232.166638-2-nirbhay.lkd@gmail.com>
Organization: Gentoo
References: <aP0-k3vlEEWNUtF8@krava>
	<20251026091232.166638-2-nirbhay.lkd@gmail.com>
User-Agent: mu4e 1.12.13; emacs 31.0.50
Date: Sun, 26 Oct 2025 10:44:50 +0000
Message-ID: <87v7k2gcwt.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Nirbhay Sharma <nirbhay.lkd@gmail.com> writes:

> Fix compilation error in UPROBE_setup caused by pointer type mismatch
> in the ternary expression when compiled with -fcf-protection. The
> probed_uprobe function pointer has the __attribute__((nocf_check))
> attribute, which causes the conditional operator to fail when combined
> with the regular probed_uretprobe function pointer:
>

Just as a curiosity to share: I found a few tangential issues and
reported them as https://gcc.gnu.org/PR122427.

>   seccomp_bpf.c:5175:74: error: pointer type mismatch in conditional
>   expression [-Wincompatible-pointer-types]
>
> Cast both function pointers to 'const void *' to match the expected
> parameter type of get_uprobe_offset(), resolving the type mismatch
> while preserving the function selection logic.
>
> This error appears with compilers that enable Control Flow Integrity
> (CFI) protection via -fcf-protection, such as Clang 19.1.2 (default
> on Fedora).
>

Reviewed-by: Sam James <sam@gentoo.org>

> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
> ---
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 874f17763536..e13ffe18ef95 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -5172,7 +5172,8 @@ FIXTURE_SETUP(UPROBE)
>  		ASSERT_GE(bit, 0);
>  	}
>  
> -	offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
> +	offset = get_uprobe_offset(variant->uretprobe ?
> +		(const void *)probed_uretprobe : (const void *)probed_uprobe);
>  	ASSERT_GE(offset, 0);
>  
>  	if (variant->uretprobe)
