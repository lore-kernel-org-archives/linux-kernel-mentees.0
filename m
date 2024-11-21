Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A1D2309B6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Nov 2024 01:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732152347; cv=none; b=ipEfS5cWJkzYk7ka3QVIkFZMhPh/O2bzAjlFoJH90nHwTCLG2vF/p/c1HbMtr+7O1EUPhVf/6i6bzsf6Chwmx4qThpYE/QbtkkJ5+2RT88lnm2DWAXLxDADYyJ5hb21FlXXFz5x+fevqe+RxKhF5/X3SeNJVmeQ4wcMFVU0GXk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732152347; c=relaxed/simple;
	bh=xvJHuxN9St/qqGCISU3aK6X3sWr74wOx7oQOb+QgKEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFpo7UVTJaa+i90a55CRW1kpTNK9XuMomhGr/HP2olZ3o6zw2OsbqpJBzWp4hq4gfA2htLkdO1ArdSnBErLMyGgzt2AbVXs+Prx2a7E9yq3J3VXKIAUFL/lRDRB5NpRcrUS5/8czDjCan1utlZmnsJ5apH4Vmy3zUMG42OnfsXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=begIcW4v; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="begIcW4v"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC4B381384
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Nov 2024 01:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1awyAZB8l6Lv for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2024 01:25:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=leocstone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 34A7580F7F
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34A7580F7F
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=begIcW4v
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 34A7580F7F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Nov 2024 01:25:45 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7206304f93aso340621b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Nov 2024 17:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732152344; x=1732757144; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jcl32RV9k1qduJDWQ/zWpkC8NvRU5+ci+GcHLWbrsSo=;
        b=begIcW4v4Ip+nqbaTm9TXGGrIkK2n/wEbY2LEv9eHQk5b0uYwdHL2GwCHBhs6dd9xE
         GcCAy3OvzkcRJLeviqUmFIrVxpif7BCtIeZIHMBtmwY+r5R0FhQwDoSoO0iPTj3oozHq
         n45hE3KbQG2WQB8+zUZBF5QjUN/qV97X110Qgn5ya8BT0Gf7gtCbuPKlNaFZUlAA5DK5
         HK/DD92SlbLDO9uWmtnzikGoKdkNCY/9Sk1NcMrYlaLfUGYhRHJpv4XP/V0l3kqt8jbU
         fHIZaTNreFvpuLABTeyjFom8B0CqmCubHzBjmNKpX6kJNIJnFX6bKi56X2byKTwxpP3z
         oZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732152344; x=1732757144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcl32RV9k1qduJDWQ/zWpkC8NvRU5+ci+GcHLWbrsSo=;
        b=tanLJEPlmdcTkHPrmj1ZnheGTbZDKiT5e4jnUowjYASgNPOvmYScI/NpfNqsi9NUMe
         8Wom5rP+NEeBXb9zZzua0oRG4VtI2m/fsWAZaRIP6JlYWD/+mg+/4456wS+dt2EIJbfx
         F5mvfaxg/XwpOuyfIK1J3XXqSIU2SUfYhol76ZkZkYaWgqXVwdNBHw6fkyjbG7z1Oi6w
         XE1mazRGWffK2Kk/aR7QF5KfJ+79X+BTTrnH14Aagvxhn1EIN2yzu4Tuud7Th9/4RU40
         4QMTP3uAFwI5oZN47OKTkTNBrLjggTZzCIZltGjuOpN4fXbv8M8Ofeko6e1/uy0w6NWS
         FcAA==
X-Forwarded-Encrypted: i=1; AJvYcCUdFuTTJnjdI5IhpwWAYn5AExDIifdwA36bPtPwhbzB8qi4KuT5xyh8Cvb4+F8XZW9oTZau7kfZpRffZxdFfGoHJ1saWQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwkxFfI16idat+nTPopsmbts7/AZfXYbxKqNcxd2DLUEzVva6m3
	hy/HM+P2ofhDEnBx3wbfHM0ol/4cVAcdW/yttA7OPls144VfT7t7
X-Gm-Gg: ASbGncsP3KT3ThCys02mNZ6O0BkLAxKSAZecmsjiqNeWJd9HjbYyWF3rpKM0/4+tT6G
	FbhYrisEbACkson7GeyNBP0qyuDbxaBC/YIzoBElp5ehcvE6oG48wwsOXwykRwxQTv5hlw9aBMp
	p/kXMk/AiO+iC7sVzONkLxhyS2fJZh/hzg1iwIivi2jR676qjyB0egnTTvoqOcfOfGe+yYqKFLr
	Zz8KGgiMq6Tbl8dLr6tLbfN0VtcJguadxutJ9w=
X-Google-Smtp-Source: AGHT+IHbxtSpOLCCWBe4aYm8HR4213iEzQzO3CI0mFE6HhbnopUM+RjkBNnbR/mj5cQsegw1jHA2tA==
X-Received: by 2002:a17:90a:fa11:b0:2ea:b564:4b31 with SMTP id 98e67ed59e1d1-2eaca72c6c7mr5726973a91.19.1732152344460;
        Wed, 20 Nov 2024 17:25:44 -0800 (PST)
Received: from tc ([2601:1c2:c104:170:aeb7:1d21:ff22:f729])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212883d3489sm1917395ad.207.2024.11.20.17.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 17:25:43 -0800 (PST)
Date: Wed, 20 Nov 2024 17:25:40 -0800
From: Leo Stone <leocstone@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next] selftests: net/psock_lib: Handle EINTR and
 EAGAIN
Message-ID: <42gn3eaqfcs7qaei7qf3nrtvcp3kztuex5ttcaahfntzx6hw6v@afsmwqb4xhmj>
References: <20241117225950.138968-1-leocstone@gmail.com>
 <673b56f7768fc_1ced1f294fa@willemb.c.googlers.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <673b56f7768fc_1ced1f294fa@willemb.c.googlers.com.notmuch>

Willem de Bruijn wrote:
> Did you observe actual issues or is this based on the comment in the
> existing code ("Should really handle EINTR and EAGAIN").

No, this patch was based purely off of the comment, and the examples of
similar code in other selftests, e.g. tools/testing/selftests/bpf/xsk.c:

> static int netlink_recvmsg(int sock, struct msghdr *mhdr, int flags)
> {
>       int len;
>
>       do {
>               len = recvmsg(sock, mhdr, flags);
>       } while (len < 0 && (errno == EINTR || errno == EAGAIN));
>
>       if (len < 0)
>               return -errno;
>       return len;
> }

> A simpler approach to dealing with EINTR is to ask glibc to restart
> with sigaction or siginterrupt.
> 

If we want to handle it that way, this patch is probably not necessary,
since there is no specific signal I would want to install a handler for.

Thanks for your feedback,
Leo

