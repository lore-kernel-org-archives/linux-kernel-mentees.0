Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C574A2D839A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Sep 2025 06:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756881667; cv=none; b=kb40jCZewCTkv3tAVJHw83e8tQOdlAHAawt2r2QZ2H2zTO2NBmo9gxabFHzJkRvBDNi6ufBevE+CGdVq1ELbBzPL6MNdcBqJpm8EKfnWg3VzicfehO4XxCoGeXDHqGuCWl+5+UGd5bwXiivnBjupjkaFQv1ZoZ4OxsuRbupZyIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756881667; c=relaxed/simple;
	bh=LgGp13SDlt6Ivvmn8YGd1v3TpCceWjDtQMhF5H6UTRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6d4m44Un+dEw4PTzzQpR80hSypkou1iOGP6NDaclCZv1CKdMcdMQ3LdIJJO6hDuTqERAm+29kUP8XytBvhffzTRSVjKC7dJfB+Zrq4CqXc24wpm0ADgyOFjMo/dHnarCtxw/J/HxSZeNCggYKK7MUUuh5c9dXzz2HKW2gpCyME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OV6nFWG/; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OV6nFWG/"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BB8B41EAB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Sep 2025 06:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -3.092
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDG2qYzsdKse for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Sep 2025 06:41:02 +0000 (UTC)
X-Greylist: delayed 3364 seconds by postgrey-1.37 at util1.osuosl.org; Wed, 03 Sep 2025 06:41:01 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E01BF41421
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E01BF41421
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=OV6nFWG/
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E01BF41421
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Sep 2025 06:41:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A3B04026F;
	Wed,  3 Sep 2025 06:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B21C4CEF0;
	Wed,  3 Sep 2025 06:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756881660;
	bh=LgGp13SDlt6Ivvmn8YGd1v3TpCceWjDtQMhF5H6UTRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OV6nFWG/tx1n4lMA44G9BjByryO8PCvPp7ANmWCmBuLDpMvQdQJVzZKnF4UDIq3VG
	 XxrWYJ6IgU677ZpTZuhr0UftSd+NbatVsDuAUs+E3hb/UWJrFHknUUAqxXNAvuE0NW
	 Mcjk4uzsAdShFJoOnAdGw6VpE4Rv3vQmhqX0wzPA=
Date: Wed, 3 Sep 2025 08:40:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: rydberg@bitmath.org, dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] Input: bcm5974 - Driver cleanup by replacing dprintk
 with dev_dbg
Message-ID: <2025090330-unruffled-slip-86a1@gregkh>
References: <20250903061908.41910-1-bhanuseshukumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903061908.41910-1-bhanuseshukumar@gmail.com>

On Wed, Sep 03, 2025 at 11:49:08AM +0530, Bhanu Seshu Kumar Valluri wrote:
> From: bhanuseshukumar <bhanuseshukumar@gmail.com>
> 
> Debug printk messages are converted to dev_dbg based logs
> for better control over debug messages using dynamic logging.
> 
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>

Does not match your "From:" line :(
