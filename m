Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC3B13AF2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 12:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752754558; cv=none; b=uk6QyP2ws7DJZVvqkvtLCWShVjrEUXya/EJnDqY6E+quEmPgeUGUOC8NSzOvAPhoCs/iLVhAtBPvKYf3MmYz0QWYoxHXsq4bPxXpmkTceSJrOz/pUK03IDAGLJ88fORCHGPL0skyOEuiuBjj52mwOGrG87Vd952o02mYhDC4exc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752754558; c=relaxed/simple;
	bh=EM42RbFyYL0/DtA9TBbRX2jwsClo5BfXKuugqhl0OAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DihGI9Y57sPkQW3FmqUzkWojkPCTs3TdZIohjqW1QLkLz6k/o/KrePx8nHdKIK60OPRX4ZLUPKl32tSNSjayf9FN9FsfXUK6IFfc4ORKYHP6TOwxgIkS99oFOdiMi/r3nE9W89XxM6ysyTd9WU9zIGfynZL/b6bAcrEUpP8T+yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YTE1EpV9; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YTE1EpV9"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5EC183D78
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 12:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lies3FlSUzzs for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jul 2025 12:15:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B75D83D6B
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B75D83D6B
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YTE1EpV9
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0B75D83D6B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 12:15:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 93C1FA578C9;
	Thu, 17 Jul 2025 12:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC71FC4CEE3;
	Thu, 17 Jul 2025 12:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752754553;
	bh=EM42RbFyYL0/DtA9TBbRX2jwsClo5BfXKuugqhl0OAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YTE1EpV9DEjrU3Ibp/VpKTZfooK7TqtykitpfwXE63VbAcc2zHQg2LLjdPLfXyHtL
	 XroaR16ZT4AwOikgQbev+VhGz6AJozsRt/5hBF7gXZopPA/sTKKvHt8JZ6bEMIBkkk
	 1M7nU6rPvc+Q0NaBg6YXGJA79XKqVR+fwksljkWE=
Date: Thu, 17 Jul 2025 14:15:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [ANNOUNCE] kernel-patch-validator - Tool to validate patches
 before submission
Message-ID: <2025071717-quadrant-rentable-e8e9@gregkh>
References: <20250717075417.8597-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250717075417.8597-1-ignacio.pena87@gmail.com>

On Thu, Jul 17, 2025 at 03:54:17AM -0400, Ignacio Peña wrote:
> Hi everyone,
> 
> After getting patches rejected multiple times for common mistakes, I built
> a tool to validate patches before submission. It catches issues that
> frequently lead to rejections.
> 
> Features:
> - 21+ automated checks based on real maintainer feedback
> - Validates format, DCO, changelog placement, dates
> - Integrated checkpatch.pl with enhanced reporting
> - Tools to find first contributions (find-bugs.sh)
> - Patch series validation
> 
> Available at: https://github.com/ipenas-cl/kernel-patch-validator
> 
> Quick usage:
> $ git format-patch -1
> $ validate-patch.sh 0001-your-patch.patch
> 
> Example issues it catches:
> - Future dates (2025 bug from wrong system clock)

Note, it is now 2025, so this check keeps failing :)

Overall, I like the idea, the implementation needs a bit of work, see
the few github issues I opened on it for details found in my testing.

Can you add some of these checks to checkpatch.pl itself?  That would be
the best thing to do in the end.  Having to use different tools makes
things harder to keep in sync and to remember to use at all.

thanks,

greg k-h
