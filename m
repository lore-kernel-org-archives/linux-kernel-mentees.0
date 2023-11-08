Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C27BD266
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 07:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA027408E8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 07:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA027408E8
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iUinuhJ1voZh
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  8 Nov 2023 07:23:02 +0000 (UTC)
X-Greylist: delayed 50569 seconds by postgrey-1.37 at util1.osuosl.org; Wed, 08 Nov 2023 07:23:02 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50E6240734
Received: from 18.mo584.mail-out.ovh.net (18.mo584.mail-out.ovh.net [188.165.54.143])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 50E6240734
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 07:23:01 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.146.106])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 3C13328988
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 07:22:59 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-lrw8n (unknown [10.110.171.1])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C53E21FD49;
	Wed,  8 Nov 2023 07:22:58 +0000 (UTC)
Received: from RCM-web9.webmail.mail.ovh.net ([151.80.29.21])
	by ghost-submission-6684bf9d7b-lrw8n with ESMTPSA
	id kPniLlI3S2WLCwAAu1LDAQ
	(envelope-from <jose.pekkarinen@foxhound.fi>); Wed, 08 Nov 2023 07:22:58 +0000
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 08 Nov 2023 09:22:58 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: dmitry.torokhov@gmail.com, rydberg@bitmath.org,
 skhan@linuxfoundation.org
Cc: rrangel@chromium.org, linux-input@vger.kernel.org,
 amandhoot12@gmail.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] Input: synaptics: enable InterTouch for ThinkPad L14 G1
In-Reply-To: <77a53e59cc4151c95942f37c88db8c75@foxhound.fi>
References: <20231008080129.17931-1-jose.pekkarinen@foxhound.fi>
 <5d857ff972e9203ef65ae2396c7285c0@foxhound.fi>
 <77a53e59cc4151c95942f37c88db8c75@foxhound.fi>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <15a2424c602616e659ff3a4f1ea731d3@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 192.42.116.186
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3986530096636274342
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddukedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeejudehhfevffeuveefjeeuleejgeevtdfghfehleffkeejueetffektefhkeetjeenucffohhmrghinheplhhinhhugihfohhunhgurghtihhonhdrohhrghenucfkphepuddvjedrtddrtddruddpudelvddrgedvrdduudeirddukeeipdduhedurdektddrvdelrddvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurghtihhonhdrohhrghdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht

On 2023-10-31 14:39, José Pekkarinen wrote:
> On 2023-10-16 18:51, José Pekkarinen wrote:
>> On 2023-10-08 11:01, José Pekkarinen wrote:
>>> Observed on dmesg of my laptop I see the following
>>> output:
>>> 
>>> [   19.898700] psmouse serio1: synaptics: queried max coordinates: x
>>> [..5678], y [..4694]
>>> [   19.936057] psmouse serio1: synaptics: queried min coordinates: x
>>> [1266..], y [1162..]
>>> [   19.936076] psmouse serio1: synaptics: Your touchpad (PNP: LEN0411
>>> PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi
>>> are not used, you might want to try setting
>>> psmouse.synaptics_intertouch to 1 and report this to
>>> linux-input@vger.kernel.org.
>>> [   20.008901] psmouse serio1: synaptics: Touchpad model: 1, fw:
>>> 10.32, id: 0x1e2a1, caps: 0xf014a3/0x940300/0x12e800/0x500000, board
>>> id: 3471, fw id: 2909640
>>> [   20.008925] psmouse serio1: synaptics: serio: Synaptics
>>> pass-through port at isa0060/serio1/input0
>>> [   20.053344] input: SynPS/2 Synaptics TouchPad as
>>> /devices/platform/i8042/serio1/input/input7
>>> [   20.397608] mousedev: PS/2 mouse device common for all mice
>>> 
>>> This patch will add its pnp id to the smbus list to
>>> produce the setup of intertouch for the device. After
>>> applying, the ouput will look like:
>>> 
>>> [   19.168664] psmouse serio1: synaptics: queried max coordinates: x
>>> [..5678], y [..4694]
>>> [   19.206311] psmouse serio1: synaptics: queried min coordinates: x
>>> [1266..], y [1162..]
>>> [   19.206325] psmouse serio1: synaptics: Trying to set up SMBus 
>>> access
>>> [   19.209545] psmouse serio1: synaptics: SMbus companion is not 
>>> ready yet
>>> [   19.283845] psmouse serio1: synaptics: Touchpad model: 1, fw:
>>> 10.32, id: 0x1e2a1, caps: 0xf014a3/0x940300/0x12e800/0x500000, board
>>> id: 3471, fw id: 2909640
>>> [   19.283863] psmouse serio1: synaptics: serio: Synaptics
>>> pass-through port at isa0060/serio1/input0
>>> [   19.328959] input: SynPS/2 Synaptics TouchPad as
>>> /devices/platform/i8042/serio1/input/input8
>>> [   19.706164] mousedev: PS/2 mouse device common for all mice
>>> 
>>> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>>> ---
>>>  drivers/input/mouse/synaptics.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>> 
>>> diff --git a/drivers/input/mouse/synaptics.c 
>>> b/drivers/input/mouse/synaptics.c
>>> index ada299ec5bba..376a041c80b2 100644
>>> --- a/drivers/input/mouse/synaptics.c
>>> +++ b/drivers/input/mouse/synaptics.c
>>> @@ -183,6 +183,7 @@ static const char * const smbus_pnp_ids[] = {
>>>  	"LEN009b", /* T580 */
>>>  	"LEN0402", /* X1 Extreme Gen 2 / P1 Gen 2 */
>>>  	"LEN040f", /* P1 Gen 3 */
>>> +	"LEN0411", /* L14 Gen 1 */
>>>  	"LEN200f", /* T450s */
>>>  	"LEN2044", /* L470  */
>>>  	"LEN2054", /* E480 */
>> 
>>     Any comments here?
>> 
>>     Thanks!
>> 
>>     José.
>> _______________________________________________
>> Linux-kernel-mentees mailing list
>> Linux-kernel-mentees@lists.linuxfoundation.org
>> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
> 
>     Ping.
> 
>     José.
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

     Sorry to bother again, I didn't hear anything from this. Can
you please take a look?

     José.
