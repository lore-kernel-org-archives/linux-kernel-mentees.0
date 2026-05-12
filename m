Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CE83C1F3A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 May 2026 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600008; cv=none; b=HLiKL2R6VAocZHksbj+vv0vAK4CZRB9qf6jDxsTuY0/PiIDUlvWE3qVMsHR3cGnQNQfvYWYUScYo4TEqf9PWjAXVZs5UQn1Hvr8vaVEFv2++29fhB/izMwXnd+gjDpk7l7+gbW2UbwWoAsm/4MdAdC7qEsDdj+JJ3+CGNYgL8uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600008; c=relaxed/simple;
	bh=VbNaStc1qBADIt4CSjtSb6nwrPlXzwDQ+ag4jwdYNoY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PpRVjX3+Mbi5G3YKRQT1KJCCsbJIc6HKnU9D3790/tPETIChS9Nh7A6H1AKPLLcnooXEgVPZpnD4s7kDTEDHbf845bwqa7mZgDEJBRrdIhNVU+fvQlpG//bvj+4giLn2p5Axac4//Q130/OQcX4WRl6k7Ng5hznOjQalbEO+m6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAWNSBZD; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAWNSBZD"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36FBD81EB5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 May 2026 15:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XaHHTeAo65NX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 May 2026 15:33:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jikos@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C0C481E9A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C0C481E9A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DAWNSBZD
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8C0C481E9A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 May 2026 15:33:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FD2D40A57;
	Tue, 12 May 2026 15:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E38C2BCC7;
	Tue, 12 May 2026 15:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778600004;
	bh=VbNaStc1qBADIt4CSjtSb6nwrPlXzwDQ+ag4jwdYNoY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DAWNSBZDEkq7tMIJMPiP42Z3Z+pLjil2O/6yPuJnJ1aNki3yPSgQVxjKKYL4YAS1h
	 q35WMdzb9MxuS9ONvFnir6ODwS+lzNA0Z+XnSsSAiscqifWfpMO1eX9etQHAxjofFI
	 AhaVgvPB3MYFTs55TdMPl6YWqVUzNbG2yCYanGJJO2USoV7IAsHMoYxD7ZQw7/0KAu
	 zHeRPEdoRY5Q4OAkeGEV9ZzT899jvdICW2wVeG5/Qcs0YIeP0dHr2cWMEbHxRsxVu0
	 xGt0NaYUx4R0/gjmZqpAf0qWENlv6GjgeT6V73G/oCdtVWRySmp98HmkaXTSnLv/Jz
	 Ot/gTLqqMS9sg==
Date: Tue, 12 May 2026 17:33:21 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-usb@vger.kernel.org, 
    linux-input@vger.kernel.org, linux-hardening@vger.kernel.org, 
    linux-kernel-mentees@lists.linuxfoundation.org, 
    Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: replace strlcat with better alternatives
In-Reply-To: <20260410192447.7059-1-mahad.ibrahim.dev@gmail.com>
Message-ID: <qo3q917q-77q7-03q2-8458-8p2q2n99q41r@xreary.bet>
References: <20260410192447.7059-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 10 Apr 2026, Mahad Ibrahim wrote:

> In preparation for the removal of the strlcat() API as per the KSPP,
> replace the string concatenation logic in hid-core, usbkbd, and
> usbmouse with struct seq_buf, which tracks the current write position
> and remaining space internally. The changes implemented include:
> 
> - Replace device name and phys concatenation with seq_buf_puts().
> - Include Struct seq_buf and its initialization.
> - Include header file of seq_buf.
> - Replace strlen() with seq_buf_used() on the string buffer which was
>   tracked by seq_buf to increase speed.
> - Add size_t len in files which did not have it.
> - Use of strscpy with length in place of strlcat.
> 
> Testing: This driver was compiled as a module as well as in-built in
> QEMU with the QEMU basic mouse, and QEMU basic keyboard. The testing was
> done in the following steps.
> - Add Hardware Mouse in QEMU checking the usbhid module.
> - Verify dmesg string name of mouse.
> - Blacklist hidusb module from auto-loading, and removing the module via
>   rmmod.
> - Load usbmouse module, and reattach QEMU mouse.
> - Verify dmesg string name of mouse.
> - Repeat same procedure on usbkbd module.
> 
> This aligns the driver with KSPP security guidelines.
> 
> Link: https://github.com/KSPP/linux/issues/370
> 
> Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

