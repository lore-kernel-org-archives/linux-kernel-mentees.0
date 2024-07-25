Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3EB3FB3B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 14:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721917316; cv=none; b=DXajusYTwuNbCPxAn/S5LwRzIRHEOAHljnVDHoRnggOy9KZf608fbFN4K5YqeEqOuWuAN9V5mCQwkLP9cvyphfs+QBzBctp1Y86p/5A1jOqfRo7/dPy5NNr4ROyNXkTWz0FTseqMjNL8V/8EI1QWduxTdS2QELrSlhpws/mUOZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721917316; c=relaxed/simple;
	bh=ZltkhJ6+a/lpCOzk3f/1/2Ffa9BzRcQT2wokwXVtug0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwVKes10oe+9iABmFBYJsJJfIBGcwi1wSMq16flKM+oF2g6XORs1noor1pB1ref9xOIHjs3mO83F4pY3QRDovj3X+PG6jhGM+GxObC+uuKEMcEy2aE6bKAt7N/GXWfnTOmv5gn+sU5W8xsXSIn+HS7RxcySihBqyFlbL2WvMzVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Jmp0mqo8; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Jmp0mqo8"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8FC760A9A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 14:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jF1jZ7yYCV8y for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jul 2024 14:21:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E09E560A94
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E09E560A94
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Jmp0mqo8
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E09E560A94
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 14:21:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 487E6CE1395;
	Thu, 25 Jul 2024 14:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7DBC116B1;
	Thu, 25 Jul 2024 14:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721917308;
	bh=ZltkhJ6+a/lpCOzk3f/1/2Ffa9BzRcQT2wokwXVtug0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jmp0mqo87s2Ah7pv9CE370F091ntWx1kp3TS1JtJYxfUzerZ09K3/O7IwabK0101m
	 +zN2OwC7Lr1MDgXWVLUuhtOmAYij9qOVGc4/eW5MA+AhizwD3x6biqeLbDtn/8tFMU
	 j2nZZDscmQ3ydotSh8X5mUAvnRyj5jVNqL7hrOJQ=
Date: Thu, 25 Jul 2024 16:21:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio =?iso-8859-1?Q?Gonz=E1lez?= Collado <sergio.collado@gmail.com>
Cc: stable@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
	Jan Kara <jack@suse.cz>,
	syzbot+600a32676df180ebc4af@syzkaller.appspotmail.com
Subject: Re: [PATCH 6.1.y] udf: Convert udf_mkdir() to new directory
 iteration code
Message-ID: <2024072521-ducky-record-3b13@gregkh>
References: <20240725135313.155137-1-sergio.collado@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240725135313.155137-1-sergio.collado@gmail.com>

On Thu, Jul 25, 2024 at 03:53:13PM +0200, Sergio González Collado wrote:
> From: Jan Kara <jack@suse.cz>
> 
> [ Upstream commit 00bce6f792caccefa73daeaf9bde82d24d50037f ]
> 
> Convert udf_mkdir() to new directory iteration code.
> 
> Signed-off-by: Jan Kara <jack@suse.cz>
> (cherry picked from commit 00bce6f792caccefa73daeaf9bde82d24d50037f)
> Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>

You changed things in this commit and didn't say what or why you did so
:(

